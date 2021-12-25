import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/models/user.dart';
import 'package:food_ninja_app/exceptions/signup_exception.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';
import 'dart:io' as i;

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late String verificationId;

  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

//==============================================================================================================================================
  //Signup_Functions
  late UserData userData;
  Future<void> signup({
    required String email,
    required String password,
    required String username,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      emit(SignupLoadingState());
      if (username.isEmpty) {
        throw MyException('Please Fill missing Field!');
      } else if (username.isNotEmpty && username.length < 6) {
        throw MyException('username must be more than 6 letters');
      } else if (password.isEmpty) {
        throw MyException('Please Fill missing Field!');
      } else if (email.isEmpty) {
        throw MyException('Please Fill missing Field!');
      } else if (phone.isEmpty) {
        throw MyException('Please Fill missing Field!');
      } else if (phone.isNotEmpty && phone.length < 11) {
        throw MyException('Please check your number Again!');
      } else {
        final userExists = await FirebaseFirestore.instance
            .collection('users')
            .where(
              'username',
              isEqualTo: username,
            )
            .get();
        if (userExists.size > 0) {
          throw MyException('This username is already used!');
        } else {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          var userID = FirebaseAuth.instance.currentUser!.uid;
          userData = UserData(
            userID: userID,
            username: username,
            email: email,
            password: password,
            phone: phone,
          );
          await submitPhoneNumber(userData.phone);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userID)
              .set(userData.toMap());

          emit(SignupSucessfullyState());
        }
      }
    } on FirebaseAuthException catch (error) {
      emit(SignupErrorState(error.message!)..showError(context));
    } catch (e) {
      emit(SignupErrorState(e.toString())..showError(context));
    }
  }

//==============================================================================================================================================
// phone_Verfiy_Services_Functions

  Future<void> submitPhoneNumber(String phoneNumber) async {
    // emit(LoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await confirmPhoneNumberVerfication(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    emit(SignupErrorState(error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitedState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitOTP(String otpCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await confirmPhoneNumberVerfication(credential);
  }

  Future<void> confirmPhoneNumberVerfication(AuthCredential credential) async {
    try {
      await FirebaseAuth.instance.currentUser!.linkWithCredential(credential);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData.userID)
          .set(
        {'isPhoneVerfied': true},
        SetOptions(merge: true),
      );
      emit(PhoneOTPVerifiedState());
    } catch (error) {
      emit(SignupErrorState(error.toString()));
    }
  }

//==============================================================================================================================================
// Profile_Services_Functions
  XFile? image;
  Future<void> pickProfilePhoto({
    required bool isFromGallery,
  }) async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera);
    image != null ? emit(PhotoTakenSucessfullyState()) : null;
  }

  void removePickedPhoto() {
    image = null;
    emit(PhotoRemovedState());
  }

  Future<void> uploadProfilePhoto(BuildContext context) async {
    try {
      emit(PhotoUploadedLoadingState());
      if (image == null || image!.path.isEmpty) {
        throw MyException(
            'please Pick your Profile Photo or you can Skip it from the top.');
      } else {
        final ref = FirebaseStorage.instance
            .ref()
            .child('profilePhotos')
            .child(userData.userID);
        await ref.putFile(i.File(image!.path));
        final imageUrl = await ref.getDownloadURL();
        userData.profilePhotoUrl = imageUrl;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userData.userID)
            .set(
                {'profilePhotoUrl': imageUrl},
                SetOptions(
                  merge: true,
                ));
        emit(PhotoUploadedSucessfullyState());
      }
    } catch (error) {
      emit(PhotoUploadedErrorState(error.toString())..showError(context));
    }
  }

//==============================================================================================================================================
// Location_Services_Functions
  late bool islocationServiceEnabled;
  late LocationPermission locationPermission;

  Future<void> askForLocationPermission(BuildContext context) async {
    try {
      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.always ||
            locationPermission == LocationPermission.whileInUse) {
          emit(LocationPermissionAcceptedState());
        } else {
          throw MyException(
              'You refused access to Location so We cant get your location For use our Application\'s services');
        }
      }
    } on PermissionRequestInProgressException catch (error) {
      emit(LocationPermissionDeniedState(error.message!)..showError(context));
    } on PermissionDefinitionsNotFoundException catch (error) {
      emit(LocationPermissionDeniedState(error.message!)..showError(context));
    } catch (error) {
      emit(LocationPermissionDeniedState(error.toString())..showError(context));
    }
  }

  Future<bool> enableLocationService() async {
    islocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    return islocationServiceEnabled;
  }

  String userCurrentLocation = 'Your Location';
  Future<void> getUsersCurrentLocation(BuildContext context) async {
    loc.Location? location;
    await askForLocationPermission(context);
    try {
      emit(GetLocationLoadingState());
      islocationServiceEnabled = await enableLocationService();
      if (!islocationServiceEnabled) {
        location = loc.Location();
        //TODO test this Function for Show Dialog for access GPS if it works well change GeoLocation Package to Location Package and rebuild the funcitons those depend on it
        islocationServiceEnabled = await location.requestService();
        // loc.LocationData x = await location.getLocation();

      } else {
        Position userCurrentPostion = await Geolocator.getCurrentPosition();
        List<Placemark> placeMarks = await placemarkFromCoordinates(
          userCurrentPostion.latitude,
          userCurrentPostion.longitude,
        );

        userCurrentLocation = placeMarks[0].street! +
            ',' +
            placeMarks[0].locality! +
            ',' +
            placeMarks[0].administrativeArea! +
            ',' +
            placeMarks[0].country! +
            ',' +
            placeMarks[0].isoCountryCode!;
        if (userCurrentLocation.isNotEmpty &&
            userCurrentLocation != 'Your Location') {
          FirebaseFirestore.instance
              .collection('users')
              .doc(userData.userID)
              .set(
            {'location': userCurrentLocation},
            SetOptions(merge: true),
          );
          userData.location = userCurrentLocation;
          emit(GetLocationSucessfullyState());
        } else {
          throw MyException('Please Check your Location Again!');
        }
      }
    } catch (error) {
      emit(GetLocationErrorState(error.toString())..showError(context));
    }
  }

//==============================================================================================================================================
// Login_Function

  Future<void> loginFun({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      emit(LoginLoadingState());
      if (email.isEmpty || password.isEmpty) {
        throw MyException('Please Fill Missing Field!');
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(LoginSucessfullyState());
      }
    } on FirebaseAuthException catch (error) {
      emit(LoginErrorState(error.message!)..showError(context));
    } catch (error) {
      emit(LoginErrorState(error.toString())..showError(context));
    }
  }
//==============================================================================================================================================
// SignOut_Function

  void signout(BuildContext context) {
    emit(SignoutLoading());
    FirebaseAuth.instance.signOut().then((value) {
      emit(SignoutSucessfully());
    }).catchError((error) {
      emit(SignoutError(error.toString())..showError(context));
    });
  }
}

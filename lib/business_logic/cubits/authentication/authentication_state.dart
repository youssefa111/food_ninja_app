part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

//====================================================================================================================================================
// Signup_service_states
class SignupLoadingState extends AuthenticationState {}

class SignupSucessfullyState extends AuthenticationState {}

class SignupErrorState extends AuthenticationState {
  final String _message;

  SignupErrorState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            useSafeArea: true,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: FlashBar(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              icon: const Icon(
                Icons.warning,
                size: 36.0,
                color: Colors.yellow,
              ),
              content: Text(
                _message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          );
        });
  }
}

// Phone_Auth_service_States
class LoadingState extends AuthenticationState {}

class PhoneNumberSubmitedState extends AuthenticationState {}

class PhoneOTPVerifiedState extends AuthenticationState {}

class PhoneOTPErrorState extends AuthenticationState {}

// Profile_Photo_service_states
class PhotoTakenSucessfullyState extends AuthenticationState {}

class PhotoRemovedState extends AuthenticationState {}

class PhotoUploadedLoadingState extends AuthenticationState {}

class PhotoUploadedSucessfullyState extends AuthenticationState {}

class PhotoUploadedErrorState extends AuthenticationState {
  final String _message;

  PhotoUploadedErrorState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

// Location_service_State
class LocationPermissionAcceptedState extends AuthenticationState {}

class LocationPermissionDeniedState extends AuthenticationState {
  final String _message;

  LocationPermissionDeniedState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class GetLocationLoadingState extends AuthenticationState {}

class GetLocationSucessfullyState extends AuthenticationState {}

class GetLocationErrorState extends AuthenticationState {
  final String _message;

  GetLocationErrorState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

//====================================================================================================================================================
// Login_service_states
class LoginLoadingState extends AuthenticationState {}

class LoginSucessfullyState extends AuthenticationState {}

class LoginErrorState extends AuthenticationState {
  final String _message;

  LoginErrorState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

//==================================================================
// Signout_service_states
class SignoutSucessfully extends AuthenticationState {}

class SignoutLoading extends AuthenticationState {}

class SignoutError extends AuthenticationState {
  final String _message;

  SignoutError(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String otpCode;
  late TextEditingController otpController;

  @override
  void initState() {
    otpController = TextEditingController();

    super.initState();
  }

  // @override
  // void dispose() {
  //   otpController.dispose();

  //   super.dispose();
  // }

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify your phone number',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style:
                  TextStyle(color: Colors.black, fontSize: 18.sp, height: 1.4),
              children: <TextSpan>[
                TextSpan(
                  text: '${widget.phoneNumber}',
                  style: const TextStyle(color: mainColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(mainColor),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      controller: otpController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: Colors.black,
        inactiveColor: Colors.black,
        inactiveFillColor: Colors.white,
        activeFillColor: secondaryColor,
        selectedColor: Colors.black,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
      },
      onChanged: (value) {},
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<AuthenticationCubit>(context).submitOTP(otpCode);
  }

  Widget _buildVrifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);

          _login(context);
        },
        child: Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110.w, 50.h),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is LoadingState) {
          showProgressIndicator(context);
        }

        if (state is PhoneOTPVerifiedState) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(uploadImageScreen);
        }

        if (state is SignupErrorState) {
          Navigator.pop(context);

          // String errorMsg = (state).message;
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(errorMsg),
          //     backgroundColor: Colors.black,
          //     duration: const Duration(seconds: 3),
          //   ),
          // );

          (state).showError(context);
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 88.h),
            child: Column(
              children: [
                _buildIntroTexts(),
                SizedBox(
                  height: 88.h,
                ),
                _buildPinCodeFields(context),
                SizedBox(
                  height: 60.h,
                ),
                _buildVrifyButton(context),
                _buildPhoneVerificationBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

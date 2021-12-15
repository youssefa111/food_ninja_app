import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthenticationCubit.get(context);
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 38.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 65.h,
                ),
                const TitleWidget(),
                SizedBox(
                  height: 19.h,
                ),
                const DescriptionWidget(),
                SizedBox(
                  height: 20.h,
                ),
                TakeImageBloc(authCubit: authCubit),
                SizedBox(
                  height: 165.h,
                ),
                UploadImageBlocWidget(
                  authCubit: authCubit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.0.w,
      ),
      child: Text(
        'This data will be displayed in your account\nprofile for security',
        style: TextStyle(
          fontSize: 12.sp,
          height: 1.5.h,
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              text: 'Upload Your Photo\nProfile  ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.sp,
                  height: 1.5.h,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '( optional )',
                  style: TextStyle(color: mainColor, fontSize: 10.sp),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, locationScreen),
            child: Text(
              'skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: thirdColor,
                height: 1.5.h,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TakeImageBloc extends StatelessWidget {
  const TakeImageBloc({
    Key? key,
    required this.authCubit,
  }) : super(key: key);

  final AuthenticationCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is PhotoTakenSucessfullyState,
          builder: (context) => Center(
            child: ImagePreviewWidget(authCubit: authCubit),
          ),
          fallback: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageButton(
                assetPath: 'lib/assets/images/signup/Gallery.png',
                buttonFun: () =>
                    authCubit.pickProfilePhoto(isFromGallery: true),
                buttonTitle: 'From Gallery',
              ),
              SizedBox(
                height: 20.h,
              ),
              ImageButton(
                assetPath: 'lib/assets/images/signup/camera.png',
                buttonFun: () =>
                    authCubit.pickProfilePhoto(isFromGallery: false),
                buttonTitle: 'Take Photo',
              ),
            ],
          ),
        );
      },
    );
  }
}

class UploadImageBlocWidget extends StatelessWidget {
  const UploadImageBlocWidget({
    Key? key,
    this.authCubit,
  }) : super(key: key);

  final AuthenticationCubit? authCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PhotoUploadedSucessfullyState) {
          Navigator.pushNamed(context, locationScreen);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! PhotoUploadedLoadingState,
          builder: (context) => Center(
            child: MainButton(
              buttonWidth: 157.w,
              buttonHeight: 57.h,
              buttonTitle: 'Next',
              buttonFun: () => authCubit!.uploadProfilePhoto(context),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          ),
        );
      },
    );
  }
}

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({
    Key? key,
    required this.authCubit,
  }) : super(key: key);

  final AuthenticationCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40.h),
          width: 245.w,
          height: 238.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            image: DecorationImage(
              image: FileImage(
                File(authCubit.image!.path),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 10.w,
          top: 50.h,
          child: InkWell(
            onTap: () => authCubit.removePickedPhoto(),
            child: Container(
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HexColor('FEFEFF').withOpacity(0.6),
              ),
              child: const Center(
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    required this.assetPath,
    required this.buttonFun,
    required this.buttonTitle,
  }) : super(key: key);

  final String assetPath;
  final VoidCallback buttonFun;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFun,
      child: Container(
        width: 325.w,
        height: 129.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(assetPath),
            SizedBox(height: 9.h),
            Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

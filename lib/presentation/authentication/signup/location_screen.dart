import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 17.w, top: 38.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 65.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                  ),
                  child: Text(
                    'Set Your Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0.w,
                  ),
                  child: Text(
                    'This data will be displayed in your account\nprofile for security',
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LocationContainer(
                  assetPath: 'lib/assets/images/signup/Pin Logo.png',
                  buttonFun: () => AuthenticationCubit.get(context)
                      .getUsersCurrentLocation(context),
                  buttonTitle: 'Set Location',
                ),
                SizedBox(
                  height: 328.h,
                ),
                Center(
                  child: MainButton(
                      buttonWidth: 157.w,
                      buttonHeight: 57.h,
                      buttonTitle: 'Next',
                      buttonFun: () {
                        if (AuthenticationCubit.get(context)
                                .userCurrentLocation !=
                            'Your Location') {
                          Navigator.pushNamed(
                            context,
                            sucessfullySignedUpScreen,
                          );
                        } else {
                          showFlash(
                              context: context,
                              duration: const Duration(seconds: 3),
                              builder: (context, controller) {
                                return Flash(
                                  controller: controller,
                                  position: FlashPosition.top,
                                  behavior: FlashBehavior.floating,
                                  backgroundColor: Colors.red[900],
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: FlashBar(
                                      icon: const Icon(
                                        Icons.warning,
                                        size: 36.0,
                                        color: Colors.yellow,
                                      ),
                                      content: const Text(
                                        'Please Get your current location First to Can Continue to enjoy our App!',
                                        style: TextStyle(
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
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationContainer extends StatelessWidget {
  const LocationContainer({
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
    return Container(
      width: 342.w,
      height: 147.h,
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Image.asset(assetPath),
              SizedBox(
                width: 14.w,
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (previous, current) {
                  return current != previous;
                },
                builder: (context, state) {
                  return Flexible(
                    child: Text(
                      AuthenticationCubit.get(context).userCurrentLocation,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(height: 20.h),
          MainButton(
            buttonWidth: 322.w,
            buttonHeight: 57.h,
            buttonTitle: buttonTitle,
            buttonFun: buttonFun,
            buttonColor: Colors.grey[100]!,
            buttonTextColor: Colors.black,
            buttonTextSize: 14.sp,
            buttonFontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

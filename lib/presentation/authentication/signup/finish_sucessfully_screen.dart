import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class SucessfullySignedUpScreen extends StatelessWidget {
  const SucessfullySignedUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/images/logo/Pattern.png',
              fit: BoxFit.fill,
              width: 1.sw,
              height: 1.sh,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 227.h,
                ),
                Image.asset(
                  'lib/assets/images/signup/sucessfully.png',
                ),
                SizedBox(
                  height: 33.h,
                ),
                Text(
                  'Congrats!',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Your Profile Is Ready To Use',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 192.h,
                ),
                MainButton(
                  buttonWidth: 157.w,
                  buttonHeight: 57.h,
                  buttonTitle: 'Try Order',
                  buttonFun: () => Navigator.pushNamedAndRemoveUntil(
                      context, navigationScreen, (route) => false),
                ),
              ],
            )
          ],
        ));
  }
}

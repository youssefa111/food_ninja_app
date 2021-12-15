import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/shared/shared_pereference.dart';
import 'package:food_ninja_app/presentation/authentication/login/login_screen.dart';

class OnBoarding2Screen extends StatelessWidget {
  const OnBoarding2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/images/onboarding/onboarding2.png'),
            Text(
              '''Food Ninja is Where your
      Comfort Food Lives''',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.5,
                fontSize: 22.sp,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '''Enjoy a fast and smooth food delivery at
                        your doorstep''',
              style: TextStyle(
                fontSize: 12.sp,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MainButton(
                buttonWidth: w(context: context) * .4,
                buttonHeight: 57,
                buttonTitle: 'Next',
                buttonFun: () {
                  CacheHelper.putData(key: 'onBoarding', value: true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                })
          ]),
    );
  }
}

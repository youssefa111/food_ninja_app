import 'package:flutter/material.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/presentation/onboarding/onboarding2_screen.dart';

class OnBoarding1Screen extends StatelessWidget {
  const OnBoarding1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/images/onboarding/onboarding1.png'),
            Text(
              '''Find your Comfort
         Food here''',
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
              '''Here You Can find a chef or dish for every
                taste and color. Enjoy!''',
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
              buttonFun: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const OnBoarding2Screen(),
                ),
              ),
            )
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 38.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BacksButton(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
                  ),
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      height: 1.5.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
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
                PaymentButton(
                  assetPath: 'lib/assets/images/signup/paypal.png',
                  buttonFun: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                PaymentButton(
                  assetPath: 'lib/assets/images/signup/visa.png',
                  buttonFun: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                PaymentButton(
                  assetPath: 'lib/assets/images/signup/Payoneer.png',
                  buttonFun: () {},
                ),
                SizedBox(
                  height: 220.h,
                ),
                Center(
                  child: MainButton(
                    buttonWidth: 157.w,
                    buttonHeight: 57.h,
                    buttonTitle: 'Next',
                    buttonFun: () =>
                        Navigator.pushNamed(context, uploadImageScreen),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.assetPath,
    required this.buttonFun,
  }) : super(key: key);

  final String assetPath;
  final VoidCallback buttonFun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFun,
      child: Container(
        width: 335.w,
        height: 73.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
            image: AssetImage(assetPath),
          ),
        ),
      ),
    );
  }
}

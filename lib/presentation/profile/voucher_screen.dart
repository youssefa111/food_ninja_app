import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 38.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BacksButton(),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Voucher Promo',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                VoucherContainer(
                  assetPath: 'lib/assets/images/voucher/Voucher 1.png',
                  buttonFun: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                VoucherContainer(
                  assetPath: 'lib/assets/images/voucher/Voucher 2.png',
                  buttonFun: () {},
                ),
                SizedBox(
                  height: 304.h,
                ),
                Center(
                  child: MainButton(
                    buttonWidth: 157.w,
                    buttonHeight: 57.h,
                    buttonTitle: 'Check out',
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

class VoucherContainer extends StatelessWidget {
  const VoucherContainer({
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
        width: 325.w,
        height: 122.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
            image: AssetImage(
              assetPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

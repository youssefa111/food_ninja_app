import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:food_ninja_app/presentation/cart/edit_location_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding:
              EdgeInsets.only(left: 14.w, top: 38.h, right: 14.w, bottom: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 11.0.w),
                child: const BacksButton(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              EditOrderContainer(
                containerTitle: 'Deliver To',
                assetPath: 'lib/assets/images/order/Icon Location.png',
                buttonFun: () => pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: editLocationScreen),
                  screen: const EditLocationScreen(),
                  withNavBar: false,
                ),
                address: '4517 Washington Ave. Manchester, Kentucky 39495',
                isPayment: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              EditOrderContainer(
                containerTitle: 'Payment Method',
                assetPath: 'lib/assets/images/signup/paypal.png',
                buttonFun: () {},
                address: '2121 6352 8465 ****',
                isPayment: true,
              ),
              const Spacer(),
              const ConfirmOrderContainer(
                subTotal: 120,
                deliveryCharge: 10,
                discount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditOrderContainer extends StatelessWidget {
  const EditOrderContainer({
    Key? key,
    required this.assetPath,
    required this.buttonFun,
    required this.address,
    required this.isPayment,
    required this.containerTitle,
  }) : super(key: key);

  final String assetPath;
  final VoidCallback? buttonFun;
  final String address;
  final bool isPayment;
  final String containerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 108.h,
      padding: isPayment
          ? EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h)
          : EdgeInsets.fromLTRB(13.w, 20.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                containerTitle,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.2)),
              ),
              const Spacer(),
              InkWell(
                onTap: buttonFun,
                child: const Text(
                  'Edit',
                  style: TextStyle(color: mainColor),
                ),
              ),
            ],
          ),
          isPayment ? SizedBox(height: 20.h) : SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: isPayment
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              isPayment
                  ? Image.asset(
                      assetPath,
                    )
                  : Image.asset(
                      assetPath,
                      width: 33.w,
                      height: 33.h,
                    ),
              isPayment ? const Spacer() : SizedBox(width: 14.w),
              isPayment
                  ? Text(
                      address,
                    )
                  : Flexible(
                      child: Text(
                        address,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.3.h,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class ConfirmOrderContainer extends StatelessWidget {
  const ConfirmOrderContainer(
      {Key? key,
      required this.subTotal,
      required this.deliveryCharge,
      required this.discount})
      : super(key: key);
  final double subTotal;
  final double deliveryCharge;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      height: 206.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: mainColor,
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/order/Pattern.png'),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 17.w, right: 10.w, top: 8.h),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text(
                        'Sub-Total',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        subTotal.toString() + ' \$',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        'Delivery Charge',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        deliveryCharge.toString() + ' \$',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        'Discount',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        discount.toString() + ' \$',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        (subTotal + deliveryCharge + discount).toString() +
                            ' \$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
                height: 57.h,
                width: 325.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'Place My Order',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor.withOpacity(0.7)),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

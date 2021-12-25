import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:food_ninja_app/presentation/cart/confirm_order_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logic Functions
    double sum = 0;
    for (var order in orderList) {
      sum = sum + order.price;
    }

    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(
            left: 14.w,
            top: 102.h,
            right: 14.w,
            bottom: kBottomNavigationBarHeight.h / 2,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 11.w,
                ),
                child: Row(
                  children: [
                    Text(
                      'Order details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: confirmOrderScreen),
                        screen: const ConfirmOrderScreen(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      child: Text(
                        'order now',
                        style: TextStyle(
                          color: thirdColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11.w,
                ),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Total price: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                      TextSpan(
                        text: '$sum\$ ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: thirdColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => orderList[index],
                  separatorBuilder: (_, index) => SizedBox(
                        height: 20.h,
                      ),
                  itemCount: orderList.length)
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItemContainer extends StatelessWidget {
  const OrderItemContainer({
    Key? key,
    required this.assetPath,
    required this.orderName,
    required this.resturantName,
    required this.price,
  }) : super(key: key);

  final String assetPath;
  final String orderName;
  final String resturantName;
  final double price;
  final int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      width: 347.w,
      height: 103.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: HexColor('#f6f8fd'),
            spreadRadius: 4,
            blurRadius: 20,
            offset: const Offset(10, 0),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            assetPath,
            height: 62.h,
            width: 62.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  orderName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  resturantName,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '\$ ' + price.toString(),
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'lib/assets/images/order/Icon Minus.png',
              width: 26.w,
              height: 26.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(_quantity.toString()),
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'lib/assets/images/order/Icon Plus.png',
              width: 26.w,
              height: 26.h,
            ),
          ),
        ],
      ),
    );
  }
}

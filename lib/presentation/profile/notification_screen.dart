import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 14.w, top: 38.h, right: 14.w),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 11.0.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: BacksButton(),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11.w,
                ),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const NotificationContainer(
                assetPath: 'lib/assets/images/notification/Success Icon.png',
                notificationContent: 'Your Order has been taken by the driver',
                notificationDate: 'Recently',
              ),
              SizedBox(
                height: 20.h,
              ),
              const NotificationContainer(
                assetPath: 'lib/assets/images/notification/Top Up Icon.png',
                notificationContent: 'Topup for \$100 was successful',
                notificationDate: '10.00 Am',
              ),
              SizedBox(
                height: 20.h,
              ),
              const NotificationContainer(
                assetPath: 'lib/assets/images/notification/Cancel Icon.png',
                notificationContent: 'Your order has been canceled',
                notificationDate: '22 Juny 2021',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.assetPath,
    required this.notificationContent,
    required this.notificationDate,
  }) : super(key: key);

  final String assetPath;
  final String notificationContent;
  final String notificationDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w),
      width: 347.w,
      height: 105.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
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
            height: 58.h,
            width: 57.w,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  notificationContent,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  notificationDate,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

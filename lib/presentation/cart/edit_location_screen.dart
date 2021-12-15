import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';

class EditLocationScreen extends StatelessWidget {
  const EditLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 38.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: const BacksButton(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Text(
                  'Shipping',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              EditLocationContainer(
                containerTitle: 'Order Location',
                assetPath: 'lib/assets/images/order/Icon Location.png',
                buttonFun: () {},
                address: '8502 Preston Rd. Inglewood, Maine 98380',
                isMyLocation: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              EditLocationContainer(
                containerTitle: 'Deliver To',
                assetPath: 'lib/assets/images/order/Icon Location.png',
                buttonFun: () {},
                address: '4517 Washington Ave. Manchester, Kentucky 39495',
                isMyLocation: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditLocationContainer extends StatelessWidget {
  const EditLocationContainer({
    Key? key,
    required this.assetPath,
    required this.buttonFun,
    required this.address,
    required this.isMyLocation,
    required this.containerTitle,
  }) : super(key: key);

  final String assetPath;
  final VoidCallback? buttonFun;
  final String address;
  final bool isMyLocation;
  final String containerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: isMyLocation ? 141.h : 108.h,
      padding: EdgeInsets.fromLTRB(13.w, 17.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            containerTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.2)),
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  assetPath,
                  width: 33.w,
                  height: 33.h,
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          address,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.3.h,
                          ),
                        ),
                      ),
                      isMyLocation
                          ? SizedBox(
                              height: 20.h,
                            )
                          : SizedBox(
                              height: 0.h,
                            ),
                      isMyLocation
                          ? InkWell(
                              onTap: buttonFun,
                              child: const Text(
                                'set Location',
                                style: TextStyle(color: mainColor),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

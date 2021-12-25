import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/product/Photo Menu.png',
            width: 376.w,
            height: 442.h,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: false,
                delegate: Toto(maxExtent: 300.h, minExtent: 0.h),
                floating: false,
              ),
              const FoodDetails(
                orderTimes: 2000,
                rate: 3.2,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: MainButton(
        buttonWidth: 326.w,
        buttonHeight: 57.h,
        buttonTitle: 'Add To Chart',
        buttonFun: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key, required this.rate, required this.orderTimes})
      : super(key: key);
  final double rate;
  final int orderTimes;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(32.r),
            topEnd: Radius.circular(32.r),
          ),
          color: HexColor('#fafbfe'),
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 18.5.h),
          primary: false,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Center(
              child: Container(
                width: 58.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: HexColor('#FEF6ED'),
                ),
              ),
            ),
            SizedBox(
              height: 21.h,
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'lib/assets/images/product/Popular Status.png',
                  width: 76.w,
                  height: 34.h,
                ),
                const Spacer(),
                Image.asset(
                  'lib/assets/images/product/Icon Location.png',
                  width: 34.w,
                  height: 34.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  // Love Food Function
                  onTap: () {},
                  child: Image.asset(
                    'lib/assets/images/product/Icon Love.png',
                    width: 34.w,
                    height: 34.h,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Rainbow Sandwich Sugarless',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27.sp,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Price: '),
                    TextSpan(
                      text: '50.0 \$',
                      style: TextStyle(
                        color: thirdColor,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  'lib/assets/images/product/Icon Star.png',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  rate.toString() + ' Rating',
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Image.asset(
                  'lib/assets/images/product/shopping-bag.png',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  orderTimes.toString() + ' Order',
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Text(
                'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                style: TextStyle(
                  fontSize: 12.sp,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Toto extends SliverPersistentHeaderDelegate {
  Toto({required this.minExtent, required this.maxExtent});
  @override
  final double minExtent;
  @override
  final double maxExtent;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({
    Key? key,
    required this.foodPath,
    required this.foodName,
    required this.price,
  }) : super(key: key);

  final String foodPath;
  final String foodName;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: foodScreen),
        screen: const FoodScreen(),
        withNavBar: false,
      ),
      child: Container(
        width: 147.w,
        height: 171.h,
        padding: EdgeInsets.only(top: 25.h),
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
        child: Column(
          children: <Widget>[
            Image.asset(
              foodPath,
              height: 71.h,
              width: 71.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              foodName,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              price.toString() + ' \$',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}

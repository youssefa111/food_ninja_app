import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:food_ninja_app/presentation/home/explore_menu_screen.dart';
import 'package:food_ninja_app/presentation/products/food_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/product/Photo Restaurant.png',
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
              const RestuarantDetails(
                resturantDistance: 18.5,
                resturantRate: 2.4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RestuarantDetails extends StatelessWidget {
  const RestuarantDetails(
      {Key? key, required this.resturantRate, required this.resturantDistance})
      : super(key: key);
  final double resturantRate;
  final double resturantDistance;

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
          padding: EdgeInsets.only(left: 20.w),
          primary: false,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 18.5.h),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
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
                      // Love Resturant Function
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
                  'Wijie Bar and Resto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.sp,
                    height: 1.3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'lib/assets/images/product/Icon map-pin.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      resturantDistance.toString() + ' Km',
                      style: TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Image.asset(
                      'lib/assets/images/product/Icon Star.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      resturantRate.toString() + ' Rating',
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Popular Menu',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: exploreMenusScreen),
                        screen: const ExploreMenusScreen(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(color: thirdColor, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 184.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => foodList[index],
                separatorBuilder: (context, index) => SizedBox(
                  width: 20.w,
                ),
                itemCount: foodList.length,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Testimonials',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => reviewsList[index],
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemCount: reviewsList.length,
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

class ReviewContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReviewContainer({
    required this.imagePath,
    required this.userName,
    required this.reviewComment,
    required this.rate,
    required this.date,
  });
  final String imagePath;
  final String userName;
  final String date;
  final String reviewComment;
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 11.h, left: 10.w),
      width: 336.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 64.r,
            height: 64.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 21.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 53.w,
                      height: 33.h,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(18.5.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'lib/assets/images/product/Icon Star2.png',
                            width: 16.67.w,
                            height: 15.85.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            rate.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor('#53E88B'),
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 28.w, bottom: 20.h),
                  child: Text(
                    reviewComment,
                    style: TextStyle(height: 1.3, fontSize: 12.sp),
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

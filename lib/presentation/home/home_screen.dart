import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:food_ninja_app/presentation/home/explore_menu_screen.dart';
import 'package:food_ninja_app/presentation/home/explore_restaurants_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTopSection(
        children: [
          const PromoAdvertising(),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.w,
              right: 32.w,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Nearest Restaurant',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: exploreRestaurantsScreen),
                    screen: const ExploreResturantsScreen(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ),
                  child: Text(
                    'View More',
                    style: TextStyle(color: thirdColor, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 184.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => resturantList[index],
              separatorBuilder: (context, index) => SizedBox(
                width: 20.w,
              ),
              itemCount: resturantList.length,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 32.w),
            child: Row(
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
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ),
                  child: Text(
                    'View More',
                    style: TextStyle(color: thirdColor, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) => menuList[index],
            separatorBuilder: (context, index) => SizedBox(
              height: 20.h,
            ),
            itemCount: menuList.length,
          ),
        ],
      ),
    );
  }
}

class PromoAdvertising extends StatelessWidget {
  const PromoAdvertising({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Image.asset(
        'lib/assets/images/home/Promo Advertising.png',
        width: 325.w,
        height: 150.h,
        fit: BoxFit.fill,
      ),
    );
  }
}

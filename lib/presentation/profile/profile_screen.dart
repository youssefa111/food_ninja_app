import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/chat/Photo Profile.png',
            width: 376.w,
            height: 442.h,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: false,
                delegate: Toto(maxExtent: 300.h, minExtent: 0.h),
                floating: false,
              ),
              const ProfileDetails(
                userName: 'Anam Wusono',
                email: 'anamwp66@gmail.com',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key, required this.userName, required this.email})
      : super(key: key);
  final String userName;
  final String email;

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
        child: Padding(
          padding: EdgeInsets.only(
            bottom: kBottomNavigationBarHeight.h / 2,
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
                children: [
                  Image.asset(
                    'lib/assets/images/profile/Member Status.png',
                    width: 111.w,
                    height: 34.h,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () =>
                        AuthenticationCubit.get(context).signout(context),
                    child: Text(
                      'logout',
                      style: TextStyle(
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                        color: thirdColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.sp,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    // Edit Info Function
                    onTap: () {},
                    child: Image.asset(
                      'lib/assets/images/profile/Edit Icon.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 14.sp, color: Colors.black.withOpacity(0.3)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 347.w,
                height: 64.h,
                padding: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.r)),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'lib/assets/images/profile/Voucher Icon.png',
                      width: 46.w,
                      height: 43.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'You Have 3 Vouchers',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Favorite',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) => favList[index],
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
                itemCount: favList.length,
              ),
            ],
          ),
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

class FavoriteFoodContainer extends StatelessWidget {
  const FavoriteFoodContainer({
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
          MainButton(
            buttonWidth: 85.w,
            buttonHeight: 29.h,
            buttonTitle: 'Buy Again',
            buttonFun: () {},
            buttonTextSize: 12.sp,
          ),
        ],
      ),
    );
  }
}

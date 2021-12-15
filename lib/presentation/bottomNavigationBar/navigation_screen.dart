import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/presentation/home/home_screen.dart';
import 'package:food_ninja_app/presentation/cart/cart_screen.dart';
import 'package:food_ninja_app/presentation/chat/chats_list_screen.dart';
import 'package:food_ninja_app/presentation/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Image.asset('lib/assets/images/home/navigationbar/Home.png'),
          title: ("Home"),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
          activeColorPrimary: CupertinoColors.systemGreen,
          activeColorSecondary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('lib/assets/images/home/navigationbar/Profile.png'),
          title: ("Profile"),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
          activeColorPrimary: CupertinoColors.systemGreen,
          activeColorSecondary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('lib/assets/images/home/navigationbar/Buy.png'),
          title: ("Cart"),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
          activeColorPrimary: CupertinoColors.systemGreen,
          activeColorSecondary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
              'lib/assets/images/home/navigationbar/activeChat.png'),
          title: ("Chat"),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
          activeColorPrimary: CupertinoColors.systemGreen,
          activeColorSecondary: Colors.black,
        ),
      ];
    }

    List<Widget> _buildScreens() {
      return const [
        HomeScreen(),
        ProfileScreen(),
        CartScreen(),
        ChatsListScreen()
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    );
  }
}

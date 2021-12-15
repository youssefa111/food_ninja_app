import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:food_ninja_app/presentation/home/filter_screen.dart';
import 'package:food_ninja_app/presentation/products/restaurant_screen.dart';
import 'package:food_ninja_app/presentation/profile/notification_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonTitle,
    required this.buttonFun,
    this.buttonColor = const Color.fromRGBO(30, 197, 121, 1),
    this.buttonTextColor = Colors.white,
    this.buttonTextSize = 16,
    this.buttonFontWeight = FontWeight.w600,
  }) : super(key: key);
  final double buttonWidth;
  final double buttonHeight;
  final String buttonTitle;
  final VoidCallback buttonFun;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonTextSize;
  final FontWeight buttonFontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFun,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: buttonTextColor,
              fontWeight: buttonFontWeight,
              fontSize: buttonTextSize,
            ),
          ),
        ),
      ),
    );
  }
}

//=========================================================================

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/logo/logo1.png',
      width: double.infinity,
      height: h(context: context) * .35,
      fit: BoxFit.cover,
    );
  }
}

//=========================================================================

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.width,
    required this.height,
    required this.myController,
    this.prefixIcon,
    this.color = Colors.white,
    this.hinTextSize = 14,
    this.hinTextColor = Colors.grey,
    this.suffixIcon,
    this.borderRadius = 15,
  }) : super(key: key);
  final String hintText;
  final bool obscureText;
  final double width;
  final double height;
  final Color color;
  final Widget? prefixIcon;
  final double hinTextSize;
  final Color hinTextColor;
  final Widget? suffixIcon;
  final double borderRadius;
  TextEditingController myController;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void dispose() {
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(color: (Colors.blueGrey[50]!)),
      ),
      color: widget.color,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextField(
          controller: widget.myController,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: widget.hinTextSize,
              color: widget.hinTextColor,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 28.22.w, vertical: 22.17.h),
          ),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}

//=========================================================================

class BacksButton extends StatelessWidget {
  const BacksButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 45.w,
        height: 45.h,
        padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 17.sp),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 173, 82, 0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: HexColor('DA6317'),
          size: 18,
        ),
      ),
    );
  }
}

//=========================================================================

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'lib/assets/images/signup/Pattern.png',
          fit: BoxFit.fill,
          width: 375.w,
        ),
        child
      ],
    );
  }
}

//=========================================================================

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'lib/assets/images/signup/Pattern.png',
          fit: BoxFit.fill,
          width: 375.w,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            bottom: kBottomNavigationBarHeight.h / 2,
          ),
          child: ListView(
            children: [
              const TopSectionHomeScreen(),
              ...children,
            ],
          ),
        )
      ],
    );
  }
}

//==============================================================================

class TopSectionHomeScreen extends StatelessWidget {
  const TopSectionHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 6.0.w, right: 14.w),
          child: Row(
            children: <Widget>[
              Text(
                'Find Your\nFavorite Food',
                style: TextStyle(
                    fontSize: 31.sp, fontWeight: FontWeight.bold, height: 1.5),
              ),
              const Spacer(),
              InkResponse(
                onTap: () => pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: notificationScreen),
                  screen: const NotificationScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  shadowColor: Colors.blueGrey[100],
                  child: SizedBox(
                    width: 45.w,
                    height: 45.h,
                    child: Image.asset(
                      'lib/assets/images/home/Icon Notifiaction.png',
                      width: 18.w,
                      height: 20.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          children: <Widget>[
            MyTextField(
              myController: searchController,
              hintText: 'What do you want to order?',
              obscureText: false,
              width: 267.w,
              height: 50.h,
              color: secondaryColor,
              prefixIcon: Image.asset(
                'lib/assets/images/home/Icon Search.png',
                width: 24.w,
                height: 24.h,
              ),
              hinTextSize: 12.sp,
              hinTextColor: HexColor('DA6317').withOpacity(0.5),
            ),
            SizedBox(
              width: 9.w,
            ),
            InkResponse(
              onTap: () => pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: filterScreen),
                screen: const FilterScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
              child: Image.asset(
                'lib/assets/images/home/Filter Icon.png',
                width: 49.w,
                height: 50.h,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

//=====================================================================================

class RestaurantContainer extends StatelessWidget {
  const RestaurantContainer({
    Key? key,
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.time,
  }) : super(key: key);

  final String restaurantImagePath;
  final String restaurantName;
  final int time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: resturantScreen),
        screen: const RestaurantScreen(),
        withNavBar: false,
      ),
      child: Container(
        width: 147.w,
        height: 184.h,
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
              restaurantImagePath,
              height: 100.r,
              width: 100.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              restaurantName,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              time.toString() + ' Mins',
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

//=====================================================================================

class MenuItemContainer extends StatelessWidget {
  const MenuItemContainer({
    Key? key,
    required this.imagePath,
    required this.foodName,
    required this.restaurantName,
    required this.price,
  }) : super(key: key);
  final String imagePath;
  final String foodName;
  final String restaurantName;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 87.h,
        width: 323.w,
        padding: EdgeInsets.fromLTRB(10.w, 11.h, 20.w, 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Row(
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  foodName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  restaurantName,
                  style: TextStyle(
                      fontSize: 14.sp, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '\$' + price.toString(),
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: HexColor('#FEAD1D'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.assetPath, required this.username})
      : super(key: key);

  final String assetPath;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 38.h, right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BacksButton(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Chat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              ChatWidget(
                assetPath: assetPath,
                buttonFun: () {},
                username: username,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 355.w,
                height: 74.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: MessageField(
                        hintText: 'Enter your Message.',
                        obscureText: false,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'lib/assets/images/chat/IconSend.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageField extends StatelessWidget {
  const MessageField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
    this.color = Colors.white,
    this.hinTextSize = 14,
    this.hinTextColor = Colors.grey,
    this.suffixIcon,
    this.borderRadius = 15,
  }) : super(key: key);
  final String hintText;
  final bool obscureText;

  final Color color;
  final Widget? prefixIcon;
  final double hinTextSize;
  final Color hinTextColor;
  final Widget? suffixIcon;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hinTextSize,
          color: hinTextColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      ),
      cursorColor: Colors.black,
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.assetPath,
    required this.buttonFun,
    required this.username,
  }) : super(key: key);

  final String assetPath;
  final VoidCallback buttonFun;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 10.h, 28.w, 9.h),
      width: 335.w,
      height: 81.h,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              assetPath,
              width: 62.w,
              height: 62.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 17.45.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  username,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 6.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                        color: HexColor('#53E88B'),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.5)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: buttonFun,
            child: Image.asset(
              'lib/assets/images/chat/Call Logo.png',
              height: 40.h,
              width: 40.w,
            ),
          ),
        ],
      ),
    );
  }
}

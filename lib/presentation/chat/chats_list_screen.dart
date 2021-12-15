import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'chat_screen.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              bottom: kBottomNavigationBarHeight.h / 2,
            ),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  'Chat',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => chatList[index],
                  separatorBuilder: (_, index) => SizedBox(
                    height: 20.h,
                  ),
                  itemCount: chatList.length,
                ),
              ],
            )),
      ),
    );
  }
}

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.assetPath,
    required this.username,
    required this.lastText,
    required this.textTime,
  }) : super(key: key);

  final String assetPath;
  final String username;
  final String lastText;
  final String textTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: chatScreen),
        screen: ChatScreen(
          assetPath: assetPath,
          username: username,
        ),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(8.w, 10.h, 12.w, 9.h),
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
                Row(
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    const Spacer(),
                    Text(
                      textTime,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  lastText,
                  style: TextStyle(
                      fontSize: 14.sp, color: Colors.black.withOpacity(0.5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

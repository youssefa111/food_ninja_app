import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';

class ExploreMenusScreen extends StatelessWidget {
  const ExploreMenusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTopSection(
        children: <Widget>[
          Text(
            'Popluar Menu',
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
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) => menuList[index],
            itemCount: menuList.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}

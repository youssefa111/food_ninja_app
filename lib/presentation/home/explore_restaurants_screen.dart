import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/helper/components/components.dart';

class ExploreResturantsScreen extends StatelessWidget {
  const ExploreResturantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTopSection(
        children: <Widget>[
          Text(
            'Popluar Restaurant',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GridView.count(
            crossAxisCount: 2,
            children: List.generate(
                resturantList.length, (index) => resturantList[index]),
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1.11,
          )
        ],
      ),
    );
  }
}

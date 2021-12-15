import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:hexcolor/hexcolor.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTopSection(
        children: <Widget>[
          Text(
            'Type',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: <Widget>[
              FilterContainer(filterName: 'Restaurant', isSelected: false),
              SizedBox(
                width: 20.w,
              ),
              FilterContainer(filterName: 'Menu', isSelected: false),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Location',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: <Widget>[
              FilterContainer(filterName: '1 Km', isSelected: false),
              SizedBox(
                width: 20.w,
              ),
              FilterContainer(filterName: '>10 Km', isSelected: false),
              SizedBox(
                width: 20.w,
              ),
              FilterContainer(filterName: '<10 Km', isSelected: false),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Food',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            runSpacing: 20.h,
            spacing: 20.w,
            children: <Widget>[
              FilterContainer(filterName: 'Cake', isSelected: false),
              FilterContainer(filterName: 'Sup', isSelected: false),
              FilterContainer(filterName: 'Main Course', isSelected: false),
              FilterContainer(filterName: 'Appetizer', isSelected: false),
              FilterContainer(filterName: 'Dessert', isSelected: false),
            ],
          ),
          SizedBox(
            height: 120.h,
          ),
          MainButton(
            buttonWidth: 325.w,
            buttonHeight: 57.h,
            buttonTitle: 'Search',
            buttonFun: () {},
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FilterContainer extends StatefulWidget {
  FilterContainer(
      {Key? key, required this.filterName, required this.isSelected})
      : super(key: key);
  final String filterName;
  bool isSelected;

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      backgroundColor: HexColor('#FEAD1D').withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      label: Text(
        widget.filterName,
        style: TextStyle(
          color: widget.isSelected ? Colors.white : HexColor('#DA6317'),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      // ignore: avoid_types_as_parameter_names
      onSelected: (bool) {
        setState(() {
          widget.isSelected = bool;
        });
      },
      selectedColor: HexColor('#DA6317'),
      selected: widget.isSelected,
      showCheckmark: false,
    );
  }
}

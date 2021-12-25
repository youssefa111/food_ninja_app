import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/data/fake_data.dart';
import 'package:food_ninja_app/data/models/restaurant.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

//==================================== Add_Data_Section =================================================
  void addNewRestaurant() {}
  void addNewMenuItem() {}
//==================================== Get_Data_Section =================================================
  void getHotDealsData() {}
  Future<void> getNearestRestaurantsData(context) async {
    try {
      emit(RestaurantsDataloadingState());
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('restaurants')
          .orderBy('restaurantID', descending: false)
          .get();

      querySnapshot.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        restaurantList.add(RestaurantModel.fromMap(data));
      });
      emit(RestaurantsDataSucessfullyState());
    } catch (e) {
      emit(RestaurantsDataErrorState(e.toString())..showError(context));
    }
  }

  void getPopularRestaurantsData() {}
  void getPopularMenuData() {}
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

//==================================== Add_Data_Section =================================================
  void addNewRestaurant() {}
  void addNewMenuItem() {}
  void addRateRestaurant() {}
  void addRateMenuItem() {}
  void addLikeRestaurant() {}
  void addLikeMenuItem() {}
  void addReview() {}
//==================================== Get_Data_Section =================================================
  void getHotDealsData() {}
  void getNearestRestaurantsData() {}
  void getPopularRestaurantsData() {}
  void getPopularMenuData() {}
}

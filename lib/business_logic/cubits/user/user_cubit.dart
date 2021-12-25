import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void addRateRestaurant() {}
  void addRateMenuItem() {}
  void addLikeRestaurant() {}
  void addLikeMenuItem() {}
  void addReview() {}
}

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class RestaurantsDataloadingState extends HomeState {}

class RestaurantsDataSucessfullyState extends HomeState {}

class RestaurantsDataErrorState extends HomeState {
  final String _message;

  RestaurantsDataErrorState(this._message);

  void showError(BuildContext context) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          return Flash(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            backgroundColor: Colors.red[900],
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlashBar(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                icon: const Icon(
                  Icons.warning,
                  size: 36.0,
                  color: Colors.yellow,
                ),
                content: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:food_ninja_app/presentation/authentication/login/login_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/finish_sucessfully_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/location_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/otp_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/payment_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/signup_screen.dart';
import 'package:food_ninja_app/presentation/authentication/signup/upload_image_screen.dart';
import 'package:food_ninja_app/presentation/bottomNavigationBar/navigation_screen.dart';
import 'package:food_ninja_app/presentation/cart/confirm_order_screen.dart';
import 'package:food_ninja_app/presentation/cart/edit_location_screen.dart';
import 'package:food_ninja_app/presentation/home/explore_menu_screen.dart';
import 'package:food_ninja_app/presentation/home/explore_restaurants_screen.dart';
import 'package:food_ninja_app/presentation/home/filter_screen.dart';
import 'package:food_ninja_app/presentation/home/home_screen.dart';
import 'package:food_ninja_app/presentation/products/food_screen.dart';
import 'package:food_ninja_app/presentation/products/restaurant_screen.dart';
import 'package:food_ninja_app/presentation/profile/notification_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(phoneNumber: phoneNumber),
        );
      case paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case uploadImageScreen:
        return MaterialPageRoute(
          builder: (_) => const UploadImageScreen(),
        );
      case locationScreen:
        return MaterialPageRoute(
          builder: (_) => const LocationScreen(),
        );
      case sucessfullySignedUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SucessfullySignedUpScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case navigationScreen:
        return MaterialPageRoute(
          builder: (_) => const NavigationScreen(),
        );
      case exploreRestaurantsScreen:
        return MaterialPageRoute(
          builder: (_) => const ExploreResturantsScreen(),
        );
      case exploreMenusScreen:
        return MaterialPageRoute(
          builder: (_) => const ExploreMenusScreen(),
        );
      case filterScreen:
        return MaterialPageRoute(
          builder: (_) => const FilterScreen(),
        );
      // case chatScreen:
      // return MaterialPageRoute(
      //   builder: (_) => const ChatScreen(),
      //   settings:
      // );
      case notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case confirmOrderScreen:
        return MaterialPageRoute(
          builder: (_) => const ConfirmOrderScreen(),
        );
      case editLocationScreen:
        return MaterialPageRoute(
          builder: (_) => const EditLocationScreen(),
        );
      case resturantScreen:
        return MaterialPageRoute(
          builder: (_) => const RestaurantScreen(),
        );
      case foodScreen:
        return MaterialPageRoute(
          builder: (_) => const FoodScreen(),
        );
    }
  }
}

// Navigator.pushNamed(
//           context,
//           characterDetailScreen,
//           arguments: character,
//         ),

/* 
pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: exploreMenusScreen),
                    screen: const ExploreMenusScreen(),
                    withNavBar: false,
                   
                  ), 
                  */

const loginScreen = '/';

const signupScreen = '/signup_screen';

const otpScreen = '/otp_screen';

const paymentScreen = '/payment_screen';

const uploadImageScreen = '/upload_image_screen';

const locationScreen = '/location_screen';

const sucessfullySignedUpScreen = '/sucessfully_signedup_screen';

const homeScreen = '/home_screen';

const navigationScreen = '/naviagtion_screen';

const exploreRestaurantsScreen = '/restaurants_screen';

const exploreMenusScreen = '/menus_screen';

const filterScreen = '/filter_screen';

const chatScreen = '/chat_screen';

const notificationScreen = '/notification_screen';

const confirmOrderScreen = '/confirm_order_screen';

const editLocationScreen = '/edit_location_screen';

const resturantScreen = '/resturant_screen';

const foodScreen = '/food_screen';

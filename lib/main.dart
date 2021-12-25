import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/presentation/authentication/login/login_screen.dart';
import 'package:food_ninja_app/presentation/onboarding/onboarding1_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'business_logic/bloc_observer.dart';
import 'business_logic/cubits/authentication/authentication_cubit.dart';
import 'helper/router/app_router.dart';
import 'helper/shared/shared_pereference.dart';
import 'presentation/bottomNavigationBar/navigation_screen.dart';

Future<void> main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // start codes
  Widget startWidget;
  dynamic onBoarding = await CacheHelper.getData(key: "onBoarding");

  if (onBoarding != null) {
    startWidget = const LoginScreen();
  } else {
    startWidget = const OnBoarding1Screen();
  }

  runApp(MyApp(
    appRouter: AppRouter(),
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter, required this.startWidget})
      : super(key: key);

  final AppRouter appRouter;
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          title: 'Flutter_ScreenUtil',
          theme: ThemeData(
            fontFamily: 'BentonSans',
            scaffoldBackgroundColor: HexColor('#fafbfe'),
          ),
          home: AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/logo/Pattern.png'),
                    fit: BoxFit.cover),
              ),
              child: Image.asset('lib/assets/images/logo/Logo.png'),
            ),
            splashIconSize: 200,
            nextScreen: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const NavigationScreen();
                  }
                  return startWidget;
                }),
            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ),
    );
  }
}

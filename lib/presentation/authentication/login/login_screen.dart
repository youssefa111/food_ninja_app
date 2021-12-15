import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Logo(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Login To Your Account ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              height: 56.h,
              width: 325.w,
              myController: emailController,
            ),
            SizedBox(
              height: 12.1.h,
            ),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              height: 56.h,
              width: 325.w,
              myController: passwordController,
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              'Or Continue With',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButtonBuilder(
                  icon: Icons.facebook,
                  elevation: 0,
                  iconColor: const Color(0xFF0D47A1),
                  onPressed: () {},
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0.r),
                      ),
                      borderSide: BorderSide(color: (Colors.blueGrey[50]!))),
                  text: 'Facebook',
                  textColor: Colors.black54,
                  backgroundColor: Colors.white,
                  width: 153.22.w,
                  height: 57.h,
                ),
                SizedBox(
                  width: 153.22.w,
                  height: 57.h,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    elevation: 0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0.r),
                        ),
                        borderSide: BorderSide(color: (Colors.blueGrey[50]!))),
                    text: 'Google',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Forgot Your Password?',
              style: TextStyle(color: mainColor, fontSize: 12.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                const Text(
                  'Dont have an account? ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      signupScreen,
                    );
                  },
                  child: Text(
                    'Join',
                    style: TextStyle(
                        color: Colors.greenAccent[700],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is LoginSucessfullyState) {
                  emailController.clear();
                  passwordController.clear();
                }
              },
              builder: (context, state) {
                return BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => MainButton(
                          buttonWidth: 141.w,
                          buttonHeight: 57.h,
                          buttonTitle: 'Login',
                          buttonFun: () async {
                            AuthenticationCubit.get(context).loginFun(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              context: context,
                            );
                          }),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja_app/business_logic/cubits/authentication/authentication_cubit.dart';
import 'package:food_ninja_app/helper/components/components.dart';
import 'package:food_ninja_app/helper/constants/constants.dart';
import 'package:food_ninja_app/helper/router/app_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController phoneContorller;
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    phoneContorller = TextEditingController();

    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    emailFocus = FocusNode();
    phoneFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneContorller.dispose();

    usernameFocus.dispose();
    passwordFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Logo(),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Sign Up For Free',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SignupField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
              image: Image.asset('lib/assets/images/signup/Profile.png'),
              keyboardType: TextInputType.name,
              focusNode: usernameFocus,
              nextFocusNode: emailFocus,
            ),
            SizedBox(
              height: 12.1.h,
            ),
            SignupField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              image: Image.asset('lib/assets/images/signup/Message.png'),
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocus,
              nextFocusNode: passwordFocus,
            ),
            SizedBox(
              height: 12.1.h,
            ),
            SignupField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              image: Image.asset('lib/assets/images/signup/Lock.png'),
              keyboardType: TextInputType.visiblePassword,
              focusNode: passwordFocus,
              nextFocusNode: phoneFocus,
            ),
            SizedBox(
              height: 12.1.h,
            ),
            SignupField(
              controller: phoneContorller,
              hintText: 'Mobile Number',
              obscureText: false,
              image: Image.asset('lib/assets/images/signup/Call logo.png'),
              keyboardType: TextInputType.phone,
              focusNode: phoneFocus,
              nextFocusNode: null,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 22.r,
                    height: 22.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainColor,
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/assets/images/signup/check.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Keep Me Signed In',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            SignupBlocWidget(
                emailController: emailController,
                passwordController: passwordController,
                usernameController: usernameController,
                phoneContorller: phoneContorller),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                'already have an account?',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 12.sp,
                    fontFamily: '',
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignupBlocWidget extends StatelessWidget {
  const SignupBlocWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.phoneContorller,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController phoneContorller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PhoneNumberSubmitedState) {
          emailController.clear();
          passwordController.clear();
          usernameController.clear();
          Navigator.of(context)
              .pushNamed(otpScreen, arguments: phoneContorller.text)
              .then((value) => phoneContorller.clear());
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! SignupLoadingState,
          builder: (context) => MainButton(
              buttonWidth: 175.w,
              buttonHeight: 57.h,
              buttonTitle: 'Create Account',
              buttonFun: () async {
                await AuthenticationCubit.get(context).signup(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  username: usernameController.text.trimLeft()..trimRight(),
                  phone: phoneContorller.text.trim(),
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
  }
}

class SignupField extends StatelessWidget {
  const SignupField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.image,
    required this.controller,
    required this.keyboardType,
    required this.focusNode,
    required this.nextFocusNode,
  }) : super(key: key);
  final String hintText;
  final bool obscureText;
  final Image? image;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: (Colors.blueGrey[50]!)),
      ),
      color: Colors.white,
      child: SizedBox(
        width: 325.w,
        height: 57.h,
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: image,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 28.22.w, vertical: 22.17.h),
          ),
          cursorColor: Colors.black,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
        ),
      ),
    );
  }
}

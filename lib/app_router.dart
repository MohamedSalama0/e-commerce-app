import 'package:e_commerce_app/view/screens/forget_password_screen/forget_password.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/on_boarding_screen/onBoarding_screen.dart';
import 'package:e_commerce_app/view/screens/sign_in_screen/sign_in.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case 'HomeScreen':
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case 'SignInScreen':
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case 'ForgetPasswordScreen':
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
    }
  }
}

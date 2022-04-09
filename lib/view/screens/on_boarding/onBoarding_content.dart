// ignore_for_file: file_names

import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import '../../../common/app_style.dart';

class OnBoarding {
  final Widget title;
  final Widget image;

  OnBoarding({required this.title, required this.image});

  static List<OnBoarding> onBoardingContent = [
    OnBoarding(
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: kBodyText1,
          children: [
            TextSpan(
              text: 'Welcome to'.toUpperCase(),
            ),
            TextSpan(
              style: const TextStyle(color: kPrimaryColor),
              text: ' marcato, '.toUpperCase(),
            ),
            TextSpan(
                text: 'Let\'s shop ! '.toUpperCase(),
                style: const TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Color(0xff22abe0),
                      blurRadius: 28,
                    ),
                  ],
                )),
          ],
        ),
      ),
      image: Image.asset(
        'assets/images/onboarding_image_1.png',
        scale: 1.3,
        width: getResponsiveScreenWidth(85),
      ),
    ),
    OnBoarding(
      title: const Text(
        'We Help People connect to store\nfast and easy',
        style: kBodyText1,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/images/onboarding_image_2.png', scale: 0.5),
    ),
    OnBoarding(
      title: const Text(
        'We Show the easy way to Shop',
        style: kBodyText1,
      ),
      image: Image.asset('assets/images/onboarding_image_3.png'),
    ),
 
  ];
}

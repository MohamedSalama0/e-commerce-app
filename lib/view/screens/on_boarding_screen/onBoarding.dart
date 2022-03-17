import 'package:flutter/cupertino.dart';

import '../../../common/app_style.dart';

class OnBoarding {
  Widget title ;
  final Widget image;

  OnBoarding({ required this.title,required this.image});

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
                )
            ),
          ],
        ),
      ),
      image: Image.asset(
        'assets/images/onboarding_image_1.png',
        scale: 0.7,
      ),
    ),
    OnBoarding(
      title: const Text('We Help People connect to store\nfast and easy',
        style: kBodyText1,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/images/onboarding_image_2.png'),
    ),
    OnBoarding(
      title: const Text('We Show the easy way to Shop',
      style: kBodyText1,
      ),
      image: Image.asset('assets/images/onboarding_image_3.png'),
    ),
    OnBoarding(
      title: const Text('join our suportive community',
        style: kBodyText1,
      ),
      image: Image.asset('assets/images/onboarding_image_4.png'),
    ),
  ];
}

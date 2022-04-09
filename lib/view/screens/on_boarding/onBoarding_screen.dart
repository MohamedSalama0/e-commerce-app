import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/app_style.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';
import '../sign_in_screen/sign_in.dart';
import 'onBoarding.dart';
import '../home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? sizeH = SizeConfig.blockSizeH;
    double? sizeV = SizeConfig.blockSizeV;
    return Scaffold(
      // backgroundColor: const Color(0xff23253C),
      body: SafeArea(
        child: Column(
          children: [
            buildHeightSpace(10),
            // Head text
            Text(
              "MARCATO",
              textAlign: TextAlign.center,
              style: kTitle2,
            ),

            buildHeightSpace(4),

            Expanded(
              flex: 8,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                itemCount: OnBoarding.onBoardingContent.length,
                itemBuilder: (context, index) =>
                    Column(
                      children: [
                        // Second text
                        SizedBox(
                          height: getResponsiveScreenHeight(5),
                          child: OnBoarding.onBoardingContent[index].title,
                        ),
                        // space
                        buildHeightSpace(4),
                        //image
                        SizedBox(
                          height: getResponsiveScreenHeight(50),
                          child: OnBoarding.onBoardingContent[index].image,
                        ),
                      ],
                    ),
              ),
            ),
            // dot indicator next and skip button
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == OnBoarding.onBoardingContent.length - 1
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: defaultButton(
                        context: context,
                        onPressed: (){
                          Navigator.pushNamed(context, 'SignInScreen');
                        },
                        text: 'Get Started',
                    ),
                      ) : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      onBordNavBtn(
                        name: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              'SignInScreen',
                          );
                        },
                      ),
                      Row(
                        children: List.generate(
                          OnBoarding.onBoardingContent.length,
                              (index) => dotIndicator(index,currentPage)!,
                        ),
                      ),
                      onBordNavBtn(
                          name: 'Next',
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
            // space
            buildHeightSpace(12)
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/common/size_config.dart';
import 'package:e_commerce_app/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: getResponsiveScreenWidth(30),
                  child: Image.asset('assets/images/main_top.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: getResponsiveScreenWidth(20),
                  child: Image.asset(
                    'assets/images/main_bottom.png',
                    color: Colors.deepPurple.withOpacity(0.3),
                  ),
                ),
              ),
              Positioned(
                top: -40,
                right: -20,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SizedBox(
                    width: getResponsiveScreenWidth(20),
                    child: Image.asset(
                      'assets/images/main_bottom.png',
                      color: Colors.blueGrey.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Welcome to marcato',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SvgPicture.asset(
                    "assets/images/chat.svg",
                    height: getResponsiveScreenHeight(45),
                  ),
                  buildHeightSpace(10),
                  Positioned(
                    left: -20,
                    child: SizedBox(
                      width: getResponsiveScreenWidth(55),
                      height: getResponsiveScreenHeight(7),
                      child: defaultButton(
                        onPressed: () 
                        {
                          Navigator.pushNamed(context, 'SignInScreen');
                        },
                        text: 'Log in',
                      ),
                    ),
                  ),
                  buildHeightSpace(5),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    width: getResponsiveScreenWidth(55),
                    height: getResponsiveScreenHeight(7),
                    child: TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () 
                      {
                        Navigator.pushNamed(context, 'SignUpScreen');
                      },
                      style: TextButton.styleFrom(
                       backgroundColor: const Color.fromARGB(255, 202, 190, 245),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: unnecessary_string_escapes

import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class SignUpBackground extends StatelessWidget {
  final Widget? child;
  const SignUpBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Indexer(
            children: [
              Positioned(
                  top: getResponsiveScreenHeight(-2.3),
                  left: getResponsiveScreenWidth(-7),
                  child: SizedBox(
                      width: getResponsiveScreenWidth(45),
                      child: Image.asset(
                        'assets/images/signup_top.png',
                        color: Colors.white.withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate,
                      ))),
           
               Indexed(
                 index: 10,
                 child: Positioned(
                   bottom: 0,
                   left: 0,
                   child: SizedBox(
                     width: getResponsiveScreenWidth(25),
                     child: Image.asset(
                            "assets/images/main_bottom.png",
                            color: const Color.fromARGB(255, 177, 179, 223).withOpacity(0.9),
                          ),
                     ),
                   ),
               ),
              
              Indexed(
                index: 11,
                child: child!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


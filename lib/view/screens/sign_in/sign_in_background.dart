// ignore_for_file: unnecessary_string_escapes

import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({
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
                      width: getResponsiveScreenWidth(40),
                      child: Image.asset(
                        'assets/images/main_top.png',
                        // color: Colors.white.withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate,
                      ))),
           
               Indexed(
                 index: 1,
                 child: Positioned(
                   bottom: 0,
                   right: 0,
                   child: SizedBox(
                     width: getResponsiveScreenWidth(27),
                     child: Image.asset(
                            "assets/images/login_bottom.png",
                            color: const Color.fromARGB(255, 156, 167, 250).withOpacity(0.8),
                          ),
                     ),
                   ),
               ),
              
              Indexed(
                index: 10,
                child: child!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


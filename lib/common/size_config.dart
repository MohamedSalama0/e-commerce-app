import 'package:flutter/material.dart';

class SizeConfig
{
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeH;
  static double? blockSizeV;


  void init (BuildContext context)
  {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;

    blockSizeH = screenWidth! / 200;
    blockSizeV = screenHeight! / 200;
  }
}
double getResponsiveScreenWidth(inputWidth)
{
  double? screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 100) * screenWidth;

}
double getResponsiveScreenHeight(inputWidth)
{
  double? screenHeight = SizeConfig.screenHeight;
  return (inputWidth / 100) * screenHeight;

}
import 'package:e_commerce_app/common/size_config.dart';
import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

const Color kPrimaryColor = Color(0xFF335087);
const Color kSecondearyColor = Colors.black87;
const Color myWhite = Color(0xFFE7E9F5);
const Color kGrey = Colors.blueGrey;
const Color kTextColor = Color(0xFF757575);
var sizeW = SizeConfig.blockSizeH;
var sizeH = SizeConfig.blockSizeV;
var fsizeW = SizeConfig.screenWidth;
const kTitle1 = TextStyle(
    fontSize: 18,
    color: kSecondearyColor,
    fontWeight: FontWeight.bold,
);

TextStyle kTitle2 = TextStyle(
  fontSize:  fsizeW! / 10,
  letterSpacing: 1.5,
  fontWeight: FontWeight.bold,
  shadows: const [
    BoxShadow(
      color: Color(0xff6cd4fd),
      blurRadius: 70,
    )
  ],
  color: const Color(0xFF335087),
);
const kBodyText1 = TextStyle(
    fontSize: 16,
    color: kSecondearyColor,
    fontWeight: FontWeight.bold

);
TextStyle kBodyText2 = const TextStyle(
    fontSize: 17,
    color: myWhite,
    letterSpacing: 1.4,
    fontWeight: FontWeight.bold

);
TextStyle kBtnText = const TextStyle(
    fontSize: 19,
    color: myWhite
);

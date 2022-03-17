import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import 'app_style.dart';

AnimatedContainer? dotIndicator(index, int currentPage) {
  return AnimatedContainer(
    margin: const EdgeInsets.only(left: 5),
    duration: const Duration(milliseconds: 400),
    height: 10.0,
    width: currentPage == index ? 23.0 : 10,
    decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kGrey,
        borderRadius: BorderRadius.circular(6)
        // shape: BoxShape.circle,
        ),
  );
}

Widget defaultButton(
    {required BuildContext context,
    required VoidCallback onPressed,
    required String text}) {
  return SizedBox(
    width: getResponsiveScreenWidth(200),
    height: getResponsiveScreenHeight(8),
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: kBodyText2,
        ),
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
        ),
      ),
    ),
  );
}

Widget buildWidthSpace(double? space) {
  var sizeW = SizeConfig.blockSizeH;
  return SizedBox(
    width: sizeW! * space!,
  );
}

Widget buildHeightSpace(double? space) {
  var sizeH = SizeConfig.blockSizeV;
  return SizedBox(
    height: sizeH! * space!,
  );
}

Widget socialCard({required String icon, required VoidCallback press}) {
  return GestureDetector(
    onTap: press,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(11.5),
      width: getResponsiveScreenWidth(12.4),
      height: getResponsiveScreenHeight(6),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              offset: Offset(7.0, 11.3))
        ],
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(icon),
    ),
  );
}

Widget noAccountText() {
  return RichText(
    text: TextSpan(
      style: TextStyle(color: kTextColor, fontSize: getResponsiveScreenWidth(5)),
      children: const [
        TextSpan(text: 'Dont have account? '),
        TextSpan(
          text: 'Sign Up',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget customSuffixIcon(String svgIcon) {
  var fsizeW = SizeConfig.screenWidth;
  return Padding(
    padding: EdgeInsets.fromLTRB(0, fsizeW! / 30, fsizeW / 23, fsizeW / 30),
    child: SvgPicture.asset(
      svgIcon,
      height: fsizeW / 12.9,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: kTextColor),
    borderRadius: BorderRadius.circular(25),
    gapPadding: 15,
  );
  return InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(horizontal: 47, vertical: 20),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

Widget onBordNavBtn({required String name, required VoidCallback onPressed}) {
  var sizeW = SizeConfig.screenWidth;
  var sizeH = SizeConfig.screenHeight;
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.cyan,
    ),
    height: sizeH! / 22,
    width: sizeW! / 4.7,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF335087),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: kBodyText2,
        ),
      ),
    ),
  );
}

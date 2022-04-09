import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_style.dart';

AnimatedContainer? dotIndicator(index, int currentPage) {
  return AnimatedContainer(
    margin: const EdgeInsets.only(left: 5),
    duration: const Duration(milliseconds: 400),
    height: 10.0,
    width: currentPage == index ? 25.0 : 10,
    decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kGrey,
        borderRadius: BorderRadius.circular(6)
        // shape: BoxShape.circle,
        ),
  );
}

Widget defaultButton({required VoidCallback onPressed, required String text}) {
  return SizedBox(
    width: getResponsiveScreenWidth(75),
    height: getResponsiveScreenHeight(8.0),
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
      margin: const EdgeInsets.symmetric(horizontal: 14),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(10.0),
      width: getResponsiveScreenWidth(11.3),
      height: getResponsiveScreenHeight(5.8),
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
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.asset(icon),
    ),
  );
}

Widget noAccountText(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Dont have account?',
        style: TextStyle(
          color: kTextColor,
          fontSize: getResponsiveScreenWidth(4.0),
        ),
      ),
      TextButton(
        child: Text(
          'Sign Up',
          style: TextStyle(
              fontSize: getResponsiveScreenWidth(4.0), color: Colors.indigo),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'SignUpScreen');
        },
      ),
    ],
  );
}

Widget socialMediaSection() {
  return Column(
    children: [
      Row(
        children: 
        [
          buildDivider(), 
          const Text('Or',style: TextStyle(color: kPrimaryColor,)),
          buildDivider(), 
        ],
      ),
      buildHeightSpace(4),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialCard(
            icon: 'assets/images/google-logo-search-new-svgrepo-com.svg',
            press: () {},
          ),
          socialCard(
            icon: 'assets/images/facebook-svgrepo-com.svg',
            press: () {},
          ),
          socialCard(
            icon: 'assets/images/twitter-social-media-svgrepo-com.svg',
            press: () {},
          ),
        ],
      ),
    ],
  );
}

Widget buildDivider() {
  return Expanded(
    child: Divider(
      thickness: 1.5,
        indent: getResponsiveScreenWidth(5),
        endIndent: getResponsiveScreenWidth(5),
        height: 1.5,
        color: Colors.grey,
      ),
  );
}

Widget customSuffixIcon({String? svgIcon, double inputScale = 15}) {
  var fsizeW = SizeConfig.screenWidth;
  return Padding(
    padding: EdgeInsets.fromLTRB(0, fsizeW! / 30, fsizeW / 23, fsizeW / 30),
    child: SvgPicture.asset(
      svgIcon!,
      height: fsizeW / inputScale,
    ),
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
    height: sizeH! / 22.0,
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

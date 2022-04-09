import 'package:e_commerce_app/view/screens/sign_in/sign_in_background.dart';
import 'package:e_commerce_app/view/screens/sign_in/sign_in_form.dart';
import 'package:flutter/material.dart';
import '../../../common/app_style.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _BodyState();
}

class _BodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: <Widget> [
            customAppBar(context),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildHeightSpace(6),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: fsizeW! / 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildHeightSpace(2.0),
                    const Text(
                      "Sign in with you'r email and password\nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    buildHeightSpace(15),
                    const SignInForm(),
                    buildHeightSpace(10),
                    noAccountText(context),
                    buildHeightSpace(2),
                    socialMediaSection(),
                    buildHeightSpace(7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SliverAppBar customAppBar(BuildContext context) {
  return SliverAppBar(
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        children: [
          Positioned(
              top: getResponsiveScreenHeight(-2.9),
              left: getResponsiveScreenWidth(-0.3),
              child: SizedBox(
                  width: getResponsiveScreenWidth(35),
                  child: Image.asset(
                    'assets/images/main_top.png',
                    // color: Colors.white.withOpacity(0.9),
                    colorBlendMode: BlendMode.modulate,
                  ))),
        ],
      ),
    ),
    title: const Text('Sign in', style: kTitle1),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_sharp),
    ),
  );
}

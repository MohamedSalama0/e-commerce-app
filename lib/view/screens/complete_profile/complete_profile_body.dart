import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import '../../../common/app_style.dart';
import '../../../common/widgets.dart';
import '../sign_up/sign_up_background.dart';
import 'complete_profile_form.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
      child: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
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
                      'Complete Profile',
                      style: TextStyle(
                        fontSize: fsizeW! / 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildHeightSpace(2),
                    const Text(
                      "Please enter your email and we will send\n you link to return to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    buildHeightSpace(10),
                    const CompleteProfileForm(),
                    buildHeightSpace(25),
                    Text(
                      "By continuing your confirm that you agree \nwith our Term and Condition",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    buildHeightSpace(5)
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
              width: getResponsiveScreenWidth(40),
              child: Image.asset(
                'assets/images/signup_top.png',
                color: Colors.white.withOpacity(0.9),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
        ],
      ),
    ),
    title: const Text('Complete Profile', style: kTitle1),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_sharp),
    ),
  );
}

import 'package:e_commerce_app/common/app_style.dart';
import 'package:flutter/material.dart';

import 'sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up",style: kTitle1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: const SignUpBody(),
      ),
    );
  }
}

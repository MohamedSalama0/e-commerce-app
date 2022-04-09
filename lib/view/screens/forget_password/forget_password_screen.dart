import 'package:e_commerce_app/common/app_style.dart';
import 'package:flutter/material.dart';

import 'forget_pass_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forget password',style: kTitle1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: const ForgetPassScreenBody(),
      ),
    );
  }
}

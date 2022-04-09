import 'package:flutter/material.dart';
import 'complete_profile_body.dart';


class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: ()=> FocusManager.instance.primaryFocus!.unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
      
        body: CompleteProfileScreen(),
      ),
    );
  }
}

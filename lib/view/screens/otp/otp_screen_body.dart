import 'package:flutter/material.dart';
import '../../../common/app_style.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({Key? key}) : super(key: key);

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getResponsiveScreenWidth(5)),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeightSpace(6),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: fsizeW! / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildHeightSpace(2.0),
              Text(
                "We sent your code to +20 127 3432 ***",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fsizeW! / 27,
                ),
              ),
              buildHeightSpace(1),
              buildTimer(),
              buildHeightSpace(25),
              const OtpForm(),
              buildHeightSpace(40),
              GestureDetector(
                 onTap: ()
                 {
                   //todo: resend the code ;
                 },
                child: const Text(
                  'Resend the code',
                  style: TextStyle(
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    // ignore: unrelated_type_equality_checks
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getResponsiveScreenWidth(16),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: otpInputDecoration(),
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getResponsiveScreenWidth(16),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: otpInputDecoration(),
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getResponsiveScreenWidth(16),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: otpInputDecoration(),
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getResponsiveScreenWidth(16),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.grey,
                  decoration: otpInputDecoration(),
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          buildHeightSpace(35),
          defaultButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, 'HomeScreen');
              }
            },
            text: 'Continue',
          )
        ],
      ),
    );
  }
}

InputDecoration otpInputDecoration() {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: getResponsiveScreenHeight(2),
    ),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: kTextColor));
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "This code will expired in ",
        style: TextStyle(fontSize: fsizeW! / 27),
      ),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: const Duration(seconds: 30),
        builder: (context, dynamic value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: externalColor, fontSize: fsizeW! / 27),
        ),
      ),
    ],
  );
}

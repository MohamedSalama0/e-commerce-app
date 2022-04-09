// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../common/constants.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';
import '../../../components/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  late String confirmPassword;

  /// emailValidatorRegExp => it's stamp type to check on input
  /// hasMatch => for comparison between input and stamp
  /// emailController.text => that argument it will be the input in
  TextEditingController emailController = TextEditingController();
  late bool _showPass1 = false;
  late bool _showPass2 = false;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          buildHeightSpace(10),
          buildPasswordFormField(),
          buildHeightSpace(10),
          buildConfirmPasswordFormField(),
          Container(
            margin: const EdgeInsets.only(left: 10,top: 10),
            child: FormError(errors: errors)),
          buildHeightSpace(7),
          defaultButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  emailValidatorRegExp.hasMatch(emailController.value.text)
                 
                  ) {
                _formKey.currentState!.save();
                Navigator.of(context).pushNamed('CompleteProfile');
              } else {
                print('invalid email');
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  Widget buildEmailFormField() {
    return SizedBox(
      width: getResponsiveScreenHeight(45),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        controller: emailController,
        onSaved: ((newValue) => email = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kEmailNullError);
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kEmailNullError)) {
            addError(error: kInvalidEmailError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: getResponsiveScreenWidth(3.0)),
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: customSuffixIcon(
            svgIcon: 'assets/images/envelop-mail-closed-svgrepo-com.svg',
          ),
        ),
      ),
    );
  }

  Widget buildPasswordFormField() {
    return SizedBox(
      width: getResponsiveScreenHeight(45),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        onSaved: ((newValue) => password = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
          } else if (value.length < 8 && !errors.contains(kPassNullError)) {
            addError(error: kShortPassError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          password = value;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: _showPass1 == false ? true : false,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: getResponsiveScreenWidth(2.8),
              fontWeight: FontWeight.w100),
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _showPass1,
                onChanged: (value) {
                  setState(() {
                    _showPass1 = value!;
                  });
                },
              ),
              customSuffixIcon(
                svgIcon: 'assets/images/lock-security-open-svgrepo-com.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConfirmPasswordFormField() {
    return SizedBox(
      width: getResponsiveScreenHeight(45),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        onSaved: ((newValue) => confirmPassword = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
          } else if (password != value && !errors.contains(kPassNullError)) {
            addError(error: kMatchPassError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.isNotEmpty && password == confirmPassword) {
            removeError(error: kMatchPassError);
            confirmPassword = value;
          }
        },
        obscureText: _showPass2 ? false : true,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: getResponsiveScreenWidth(2.8)),
          labelText: "Confirm Password",
          hintText: "Re-Enter your password",
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _showPass2,
                onChanged: (value) {
                  setState(() {
                    _showPass2 = value!;
                  });
                },
              ),
              customSuffixIcon(
                svgIcon: 'assets/images/lock-security-open-svgrepo-com.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

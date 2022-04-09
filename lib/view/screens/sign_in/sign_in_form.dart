import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';
import '../../../common/app_style.dart';
import '../../../common/constants.dart';
import '../../../common/widgets.dart';
import '../../../components/form_error.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool value = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController pass_controller = TextEditingController();
  TextEditingController em_Controller = TextEditingController();

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          buildHeightSpace(8),
          buildPasswordFormField(),
          buildHeightSpace(1),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: FormError(errors: errors)),
          Row(
            children: [
              Checkbox(
                value: value,
                activeColor: kPrimaryColor,
                onChanged: (remember) {
                  setState(() {
                    value = remember!;
                  });
                },
              ),
              const Text('Remember me', style: TextStyle(fontSize: 13)),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'ForgetPasswordScreen');
                },
                child: const Text('Forget password !',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
              )
            ],
          ),
          buildHeightSpace(5),
          defaultButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  em_Controller.value.text.isNotEmpty &&
                  pass_controller.value.text.isNotEmpty) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, 'HomeScreen');
              }
            },
            text: 'Login',
          ),
        ],
      ),
    );
  }

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

  Widget buildEmailFormField() {
    // print('who called method:===>${StackTrace.current}');
    return SizedBox(
      width: getResponsiveScreenHeight(45),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        controller: em_Controller,
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
          // contentPadding: const EdgeInsets.symmetric(horizontal: 40 ),
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
        controller: pass_controller,
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
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: customSuffixIcon(
            svgIcon: 'assets/images/lock-security-open-svgrepo-com.svg',
          ),
        ),
      ),
    );
  }
}

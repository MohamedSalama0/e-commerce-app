import 'package:flutter/material.dart';

import '../../../common/app_style.dart';
import '../../../common/constants.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';
import '../../../components/form_error.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _BodyState();
}

bool value = false;
final _formKey = GlobalKey<FormState>();
final List<String> errors = [];

late String email;
late String password;

class _BodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getResponsiveScreenWidth(5)),
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
              buildHeightSpace(1.2),
              const Text(
                "Sign in with you'r email and password\nor continue with social media",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              buildHeightSpace(10),
              buildEmailFormField(),
              buildHeightSpace(8),
              buildPasswordFormField(),
              buildHeightSpace(3),
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
                  const Text('Remember me',style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  TextButton(
                    onPressed: ()
                    {
                      Navigator.pushNamed(context, 'ForgetPasswordScreen');
                    },
                    child: const Text(
                      'Forget password !',
                        style: TextStyle(decoration: TextDecoration.underline,fontSize: 15)
                    ),
                  )
                ],
              ),
              buildHeightSpace(7),
              FormError(errors: errors),
              defaultButton(
                context: context,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                text: 'Continue',
              ),
              buildHeightSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialCard(
                    icon:
                        'assets/images/google-logo-search-new-svgrepo-com.svg',
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
              buildHeightSpace(9),
              noAccountText(),
              buildHeightSpace(3),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    // print('who called method:===>${StackTrace.current}');
    return TextFormField(
      onSaved: ((newValue) => email = newValue!),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kEmailNullError);
            errors.add(kInvalidEmailError);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: customSuffixIcon(
          'assets/images/envelop-mail-closed-svgrepo-com.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: ((newValue) => password = newValue!),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: customSuffixIcon(
          'assets/images/lock-security-open-svgrepo-com.svg',
        ),
      ),
    );
  }
}

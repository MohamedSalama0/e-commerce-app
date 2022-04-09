import 'package:e_commerce_app/common/size_config.dart';
import 'package:flutter/material.dart';

import '../../../common/app_style.dart';
import '../../../common/constants.dart';
import '../../../common/widgets.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getResponsiveScreenWidth(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeightSpace(6),
            Text(
              'Register Account',
              style: TextStyle(
                fontSize: fsizeW! / 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildHeightSpace(2.0),
            const Text(
              "Complete your details or continue\n with social media",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            buildHeightSpace(8),
            const SignUpForm(),
            buildHeightSpace(8),
            defaultButton(
              context: context,
              onPressed: () {},
              text: 'Continue',
            ),
            buildHeightSpace(13),
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
            buildHeightSpace(13),
            Text(
              'By continuing your confirm that you agree \nwith our Term and Condition',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          buildHeightSpace(8),
          buildPasswordFormField(),
          buildHeightSpace(8),
          TextFormField(
            onSaved: ((newValue) => password = newValue!),
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kPassNullError)) {
                setState(() {
                  errors.add(kPassNullError);
                });
              } else if (value.length < 8 &&
                  !errors.contains(kShortPassError)) {
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
              } else if (value.length >= 8 &&
                  errors.contains(kShortPassError)) {
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-Enter your password",
              suffixIcon: customSuffixIcon(
                'assets/images/lock-security-open-svgrepo-com.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
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

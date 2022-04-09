import 'package:e_commerce_app/common/app_style.dart';
import 'package:e_commerce_app/common/constants.dart';
import 'package:e_commerce_app/common/size_config.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets.dart';

class ForgetPassScreenBody extends StatefulWidget {
  const ForgetPassScreenBody({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreenBody> createState() => _ForgetPassScreenBodyState();
}

final List<String> errors = [];
late String email;
final _formKey = GlobalKey<FormState>();
double? sizeW = SizeConfig.screenWidth;

class _ForgetPassScreenBodyState extends State<ForgetPassScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getResponsiveScreenWidth(10)),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeightSpace(6),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: fsizeW! / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildHeightSpace(1.2),
              const Text(
                "Please enter your email and we will send\n you link to return to your account",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              buildHeightSpace(35),
              buildForgetPassFormField(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: FormError(errors: errors),
              ),
              buildHeightSpace(20),
              defaultButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                text: 'Continue',
              ),
              buildHeightSpace(30),
              noAccountText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForgetPassFormField() {
    return SizedBox(
      width: getResponsiveScreenHeight(45),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        onSaved: ((newValue) => email = newValue!),
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError) &&
              !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
          return null;
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
            svgIcon: 'assets/images/envelop-mail-closed-svgrepo-com.svg',
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../common/constants.dart';
import '../../../common/size_config.dart';
import '../../../common/widgets.dart';
import '../../../components/form_error.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey2 = GlobalKey<FormState>();
  List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phone;
  String? adress;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
      child: Column(
        children: [
          buildFirstNameFormField(),
          buildHeightSpace(10),
          buildLastNameFormField(),
          buildHeightSpace(10),
          buildPhoneNumberFormField(),
          Container(
              margin: const EdgeInsets.only(left: 10,top: 10),
              child: FormError(errors: errors)),
          buildHeightSpace(10),
          defaultButton(
            onPressed: () {
              if (_formKey2.currentState!.validate() && 
              _firstNameController.value.text.isNotEmpty && 
              _lastNameController.value.text.isNotEmpty && 
              _phoneNameController.value.text.isNotEmpty
              ){
                _formKey2.currentState!.save();
                Navigator.of(context).pushNamed('OtpScreen');
              }else {
                print('there is somthing wrong!');
              }
            },
            text: 'Continue',
          )
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

  Widget buildFirstNameFormField() {
    // print('who called method:===>${StackTrace.current}');
    return SizedBox(
      width: getResponsiveScreenWidth(75),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        controller: _firstNameController,
        keyboardType: TextInputType.name,
        onSaved: ((newValue) => firstName = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNamelNullError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
        },
        decoration: InputDecoration(
          labelText: "First Name",
          hintText: "Enter your First Name",
          suffixIcon: customSuffixIcon(
            inputScale: 11.0,
            svgIcon: 'assets/images/user-svgrepo-com.svg',
          ),
        ),
      ),
    );
  }

  Widget buildLastNameFormField() {
    return SizedBox(
      width: getResponsiveScreenWidth(75),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        controller: _lastNameController,
        onSaved: ((newValue) => lastName = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNamelNullError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
        },
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: "Last Name",
          hintText: "Enter your Last Name",
          suffixIcon: customSuffixIcon(
            svgIcon: 'assets/images/user-svgrepo-com.svg',
            inputScale: 11.0,
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberFormField() {
    return SizedBox(
      width: getResponsiveScreenWidth(75),
      height: getResponsiveScreenHeight(8),
      child: TextFormField(
        controller: _phoneNameController,
        onSaved: ((newValue) => phone = newValue!),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPhoneNumberNullError);
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPhoneNumberNullError);
          }
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          suffixIcon: customSuffixIcon(
            inputScale: 17.5,
            svgIcon: 'assets/images/telephone-svgrepo-com.svg',
          ),
        ),
      ),
    );
  }
}

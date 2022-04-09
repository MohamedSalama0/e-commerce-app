import 'package:e_commerce_app/common/app_style.dart';
import 'package:e_commerce_app/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key, required this.errors}) : super(key: key);
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Column(
        children: List.generate(
          errors.length,
          (index) => formError(error: errors[index]),
        ),
      ),
    );
  }
}

Widget formError({error}) {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/images/fail-error-alert-notification-warning-svgrepo-com.svg',
        color: Color.fromARGB(255, 187, 88, 88),
        height: getResponsiveScreenHeight(3.5),
        width: getResponsiveScreenWidth(3.5),
      ),
      buildWidthSpace(3),
      Text(
        error,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      ),
    ],
  );
}

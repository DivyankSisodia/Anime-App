import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../common/text_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          AuthTextFields(
              hinttext: DTexts.loginEmailField, style: DStyle.textField),
          Gap(20),
          AuthTextFields(
            hinttext: DTexts.passwordSignUp,
            style: DStyle.textField,
          ),
          Gap(20),
          AuthTextFields(
            hinttext: DTexts.confirmPasswordSignUp,
            style: DStyle.textField,
          ),
        ],
      ),
    );
  }
}

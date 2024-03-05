import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/widgets/auth/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/text_strings.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AuthTextFields(hinttext: DTexts.loginEmailField, style: DStyle.textField,),
        Gap(20),
        AuthTextFields(hinttext: DTexts.loginPassword, style: DStyle.textField),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../common/text_field.dart';

class LoginTextFormFieldSection extends StatelessWidget {
  const LoginTextFormFieldSection({
    super.key,
    required GlobalKey<FormState> formkey,
    required Animation<double> textFieldAnimation,
    required this.emailController,
    required this.emailRegex,
    required this.passwordController,
  })  : _formkey = formkey,
        _textFieldAnimation = textFieldAnimation;

  final GlobalKey<FormState> _formkey;
  final Animation<double> _textFieldAnimation;
  final TextEditingController emailController;
  final RegExp emailRegex;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formkey,
      child: Column(
        children: [
          AuthTextFields(
            textFieldAnimation: _textFieldAnimation,
            controller: emailController,
            text: DTexts.loginEmailField,
            style: DStyle.textField,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const Gap(20),
          AuthTextFields(
            textFieldAnimation: _textFieldAnimation,
            controller: passwordController,
            text: DTexts.loginPassword,
            style: DStyle.textField,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

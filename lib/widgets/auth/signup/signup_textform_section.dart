import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../common/text_field.dart';

class SignUpTextFormSection extends StatelessWidget {
  const SignUpTextFormSection({
    super.key,
    required Animation<double> textFieldAnimation,
    required this.emailController,
    required this.emailRegex,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : _textFieldAnimation = textFieldAnimation;

  final Animation<double> _textFieldAnimation;
  final TextEditingController emailController;
  final RegExp emailRegex;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextFields(
          textFieldAnimation: _textFieldAnimation,
          controller: emailController,
          text: DTexts.loginEmailField,
          style: DStyle.textField,
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@')) {
              return 'Please enter a valid email';
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
          text: DTexts.passwordSignUp,
          style: DStyle.textField,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        const Gap(20),
        AuthTextFields(
          textFieldAnimation: _textFieldAnimation,
          controller: confirmPasswordController,
          text: DTexts.confirmPasswordSignUp,
          style: DStyle.textField,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}

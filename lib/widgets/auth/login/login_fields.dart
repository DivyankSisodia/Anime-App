import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/widgets/auth/common/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/text_strings.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({
    super.key,
  });

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textFieldAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _textFieldAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: _textFieldAnimation,
          child: const AuthTextFields(
            hinttext: DTexts.loginEmailField,
            style: DStyle.textField,
          ),
        ),
        const Gap(20),
        FadeTransition(
          opacity: _textFieldAnimation,
          child: const AuthTextFields(
            hinttext: DTexts.loginPassword,
            style: DStyle.textField,
          ),
        ),
      ],
    );
  }
}

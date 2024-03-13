import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AuthTextFields extends StatelessWidget {
  const AuthTextFields({
    super.key,
    required Animation<double> textFieldAnimation,
    required this.controller,
    required this.text,
    required this.style,
    required this.validator,
  }) : _textFieldAnimation = textFieldAnimation;

  final Animation<double> _textFieldAnimation;
  final TextEditingController controller;
  final String text;
  final TextStyle style;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle:
              TextStyle(color: Color.fromARGB(255, 53, 210, 39), fontSize: 14),
        ),
      ),
      child: FadeTransition(
        opacity: _textFieldAnimation,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: DColors.textFieldColor,
            hintText: text,
            hintStyle: style,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AuthTextFields extends StatelessWidget {
  const AuthTextFields({
    super.key, required this.hinttext, required this.style,
  });

  final String hinttext;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: DColors.textFieldColor,
          hintText: hinttext,
          hintStyle: style, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/style.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: DStyle.smallHeadingText,
    );
  }
}

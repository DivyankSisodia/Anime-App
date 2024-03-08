import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          color: DColors.lightColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Center(
          child: Text(
            DTexts.signout,
            style: DStyle.lightbuttonText,
          ),
        ),
      ),
    );
  }
}

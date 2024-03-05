import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';

class SignUpRememberMe extends StatelessWidget {
  const SignUpRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Checkbox.adaptive(
            value: true,
            onChanged: (value) {},
            splashRadius: 20,
          ),
          const Text(
            DTexts.remember,
            style: TextStyle(
              color: DColors.textFieldColor,
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

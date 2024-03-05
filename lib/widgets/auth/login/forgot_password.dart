import 'package:flutter/material.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class ForgotPasswordOrRememberMe extends StatelessWidget {
  const ForgotPasswordOrRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox.adaptive(
                value: true,
                onChanged: (value) {},
                splashRadius: 20,
              ),
              const Text(DTexts.remember, style: DStyle.misctext),
            ],
          ),
          const Text(DTexts.forgotPassword, style: DStyle.misctext),
        ],
      ),
    );
  }
}

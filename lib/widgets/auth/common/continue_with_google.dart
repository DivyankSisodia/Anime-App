import 'package:flutter/material.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class ContinueWithText extends StatelessWidget {
  const ContinueWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(DTexts.or, style: DStyle.misctext);
  }
}

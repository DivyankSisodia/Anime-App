import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Divider(
        thickness: 2,
        color: DColors.pureWhite,
      ),
    );
  }
}

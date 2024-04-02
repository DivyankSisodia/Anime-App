import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/style.dart';

class AdditionalInfoText extends StatelessWidget {
  const AdditionalInfoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2023',
          style: DStyle.misctext5,
        ),
        Gap(10),
        Text(
          '16+',
          style: DStyle.misctext5,
        ),
        Gap(20),
        Text(
          'Seasons',
          style: DStyle.misctext6,
        ),
      ],
    );
  }
}

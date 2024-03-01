// ignore_for_file: camel_case_types

import 'package:anime_app/widgets/HomeScreen/common/text_heading.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class viewAllHeading extends StatelessWidget {
  const viewAllHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleORHeading(
          title: DTexts.popular,
          fontstyle: DStyle.mediumHeading,
        ),
        TitleORHeading(
          title: DTexts.seeAll,
          fontstyle: DStyle.smalllightbuttonText,
        ),
      ],
    );
  }
}

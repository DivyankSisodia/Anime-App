import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/helper/helper_functions.dart';

class DefaultLoadedScreen extends StatelessWidget {
  const DefaultLoadedScreen({
    super.key, required this.image, required this.title, required this.subTitle, required this.buttonText,
  });

  final String image;
  final String title;
  final String subTitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DHelperFunctions.screenHeight(context),
      width: DHelperFunctions.screenWidth(context),
      color: DColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const Gap(1),
          Text(
            title,
            style: DStyle.mediumHeading,
          ),
          const Gap(2),
          Text(
            subTitle,
            style: DStyle.smallHeadingText,
          ),
          const Gap(10),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: DColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: DStyle.smallboldlightbuttonText,
              ),
            ),
          )
        ],
      ),
    );
  }
}

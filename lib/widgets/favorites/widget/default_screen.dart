import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';

class DefaultLoadedScreen extends StatelessWidget {
  const DefaultLoadedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DHelperFunctions.screenHeight(context),
      width: DHelperFunctions.screenWidth(context),
      color: DColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Ellipse 18.png'),
          const Gap(1),
          const Text(
            DTexts.noWatchedContent,
            style: DStyle.mediumHeading,
          ),
          const Gap(2),
          const Text(
            DTexts.noWatchedContentSub,
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
            child: const Center(
              child: Text(
                DTexts.browseAll,
                style: DStyle.smallboldlightbuttonText,
              ),
            ),
          )
        ],
      ),
    );
  }
}

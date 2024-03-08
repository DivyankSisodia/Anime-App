import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';

class PreferenceBox extends StatelessWidget {
  const PreferenceBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DHelperFunctions.screenHeight(context) * 0.21,
      width: DHelperFunctions.screenWidth(context) * 0.9,
      decoration: BoxDecoration(
        color: DColors.lightColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  DTexts.audioLang,
                  style: DStyle.smalllightbuttonText,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      DTexts.lang,
                      style: DStyle.smalllightbuttonText,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: DColors.textSecondaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  DTexts.subtitleLang,
                  style: DStyle.smalllightbuttonText,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      DTexts.appLang,
                      style: DStyle.smalllightbuttonText,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: DColors.textSecondaryColor,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  DTexts.mobileData,
                  style: DStyle.smalllightbuttonText,
                ),
              ),
              SizedBox(
                height: 40,
                child: Switch(
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  DTexts.matureContent,
                  style: DStyle.smalllightbuttonText,
                ),
              ),
              SizedBox(
                height: 40,
                child: Switch(
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

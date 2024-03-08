import 'package:flutter/material.dart';

import '../../../screen/user_profile/edit_profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../HomeScreen/common/text_heading.dart';

class ProfileHeadingSection extends StatelessWidget {
  const ProfileHeadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: DHelperFunctions.screenHeight(context) * 0.017,
          ),
          child: const TitleORHeading(
            title: DTexts.profile,
            fontstyle: DStyle.mediumHeading,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfileSection(),
              ),
            );
          },
          child: const Column(
            children: [
              Icon(
                Icons.edit,
                color: DColors.pureWhite,
              ),
              Text(
                'Edit Profile',
                style: DStyle.smalllightbuttonText,
              ),
            ],
          ),
        )
      ],
    );
  }
}

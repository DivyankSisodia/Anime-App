import 'package:anime_app/widgets/auth/signup/remember_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';
import '../common/continue_with_google.dart';
import '../common/heading_text.dart';
import '../common/login_btn.dart';
import '../common/social_icons.dart';
import '../common/subheading.dart';
import '../login/dont_have_an_accnt.dart';
import 'signup_field.dart';

class SignUpPageContainer extends StatelessWidget {
  const SignUpPageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DHelperFunctions.screenHeight(context),
      width: DHelperFunctions.screenWidth(context),
      decoration: const BoxDecoration(
        color: DColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: const Column(
        children: [
          Gap(60),
          Heading(text: DTexts.signUpHeading, style: DStyle.loginHeading),
          SubHeading(
            subHeading: DTexts.signUpSubHeading,
            style: DStyle.smallboldlightbuttonText,
          ),
          Gap(50),
          SignUpFields(),
          SignUpRememberMe(),
          Gap(25),
          AuthButton(buttonText: DTexts.signUpButtonText),
          Gap(8),
          DontHaveAnAccount(text: DTexts.newUser),
          Gap(25),
          ContinueWithText(),
          Gap(20),
          SocialIcons(),
        ],
      ),
    );
  }
}

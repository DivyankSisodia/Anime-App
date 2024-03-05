import 'package:anime_app/widgets/auth/login/forgot_password.dart';
import 'package:anime_app/widgets/auth/login/login_fields.dart';
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
import 'dont_have_an_accnt.dart';

class LoginPageContainer extends StatelessWidget {
  const LoginPageContainer({
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
          Gap(70),
          Heading(
            text: DTexts.loginHeading,
            style: DStyle.loginHeading,
          ),
          SubHeading(
            subHeading: DTexts.loginSubHeading,
            style: DStyle.smallboldlightbuttonText,
          ),
          Gap(60),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: LoginTextFields(),
          ),
          ForgotPasswordOrRememberMe(),
          Gap(30),
          AuthButton(buttonText: DTexts.loginButtonText),
          Gap(8),
          DontHaveAnAccount(text: DTexts.or),
          Gap(30),
          ContinueWithText(),
          Gap(20),
          SocialIcons()
        ],
      ),
    );
  }
}

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

class LoginPageContainer extends StatefulWidget {
  const LoginPageContainer({
    super.key,
  });

  @override
  State<LoginPageContainer> createState() => _LoginPageContainerState();
}

class _LoginPageContainerState extends State<LoginPageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _containerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _containerAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _containerAnimation,
      child: Container(
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
      ),
    );
  }
}

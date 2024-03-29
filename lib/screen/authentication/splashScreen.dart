// ignore_for_file: file_names
import 'package:anime_app/bottom_navbar.dart';
import 'package:anime_app/utils/constants/sizes.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper/helper_functions.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_image.jpeg',
            fit: BoxFit.fitHeight,
            width: DHelperFunctions.screenWidth(context),
            height: DHelperFunctions.screenHeight(context),
          ),
          Container(
            width: DHelperFunctions.screenWidth(context),
            height: DHelperFunctions.screenHeight(context),
            color: Colors.black.withOpacity(0.8),
          ),
          const Center(
            child: Text(DTexts.splashTitle, style: DStyle.largeHeading),
          ),
          Positioned(
            bottom: DHelperFunctions.screenHeight(context) * 0.25,
            left: DHelperFunctions.screenWidth(context) * 0.25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: DHelperFunctions.screenWidth(context) * .5,
                height: DHelperFunctions.screenHeight(context) * 0.080,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DSizes.borderRadiusLg),
                  color: DColors.lightColor,
                ),
                child: const Center(
                  child: Text(DTexts.loginButtonText,
                      style: DStyle.lightbuttonText),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: DHelperFunctions.screenHeight(context) * 0.13,
            left: DHelperFunctions.screenWidth(context) * 0.25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: Container(
                width: DHelperFunctions.screenWidth(context) * .5,
                height: DHelperFunctions.screenHeight(context) * 0.080,
                decoration: BoxDecoration(
                  color: DColors.buttonColor,
                  borderRadius: BorderRadius.circular(DSizes.borderRadiusLg),
                ),
                child: const Center(
                  child: Text(DTexts.signUpButtonText,
                      style: DStyle.darkbuttonText),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 900),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 600),
                    opaque: false,
                    pageBuilder: (context, animation, secondaryanimation) {
                      animation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.decelerate,
                      );
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(animation),
                        child: CustomBottomNavbar(),
                      );
                    },
                  ),
                );
              },
              child: const Text(
                DTexts.skip,
                style: TextStyle(
                  color: DColors.buttonColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

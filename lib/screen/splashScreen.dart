// ignore_for_file: file_names
import 'package:anime_app/utils/constants/sizes.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_functions.dart';

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
            child: Text(
              DTexts.splashTitle,
              style: TextStyle(
                color: DColors.splashColor,
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            bottom: DHelperFunctions.screenHeight(context) * 0.25,
            left: DHelperFunctions.screenWidth(context) * 0.25,
            child: Container(
              width: DHelperFunctions.screenWidth(context) * .5,
              height: DHelperFunctions.screenHeight(context) * 0.080,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DSizes.borderRadiusLg),
                color: DColors.lightColor,
              ),
              child: const Center(
                child: Text(
                  DTexts.loginButtonText,
                  style: TextStyle(
                    color: DColors.textlightColor,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: DHelperFunctions.screenHeight(context) * 0.13,
            left: DHelperFunctions.screenWidth(context) * 0.25,
            child: Container(
              width: DHelperFunctions.screenWidth(context) * .5,
              height: DHelperFunctions.screenHeight(context) * 0.080,
              decoration: BoxDecoration(
                color: DColors.buttonColor,
                borderRadius: BorderRadius.circular(DSizes.borderRadiusLg),
              ),
              child: const Center(
                child: Text(
                  DTexts.signUpButtonText,
                  style: TextStyle(
                    color: DColors.backgroundColor,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 100,
            right: 20,
            child: Text(
              DTexts.skip,
              style: TextStyle(
                color: DColors.buttonColor,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

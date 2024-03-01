import 'package:anime_app/screen/login_screen.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../utils/constants/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.lightColor,
      appBar: AppBar(
        backgroundColor: DColors.lightColor,
        leading: Image.asset(
          'assets/icons/Up Arrow.png',
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
                child: Column(
                  children: [
                    const Gap(60),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        DTexts.signUpHeading,
                        style: TextStyle(
                          color: DColors.textFieldColor,
                          fontSize: 35,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Text(
                      DTexts.signUpSubHeading,
                      style: TextStyle(
                        color: DColors.buttonColor,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap(50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                filled: true,
                                fillColor: DColors.textFieldColor,
                                hintText: DTexts.loginEmailField,
                                hintStyle: const TextStyle(
                                  color: DColors.textSecondaryColor,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                filled: true,
                                fillColor: DColors.textFieldColor,
                                hintText: DTexts.loginPassword,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: DColors.primaryColor,
                                  ),
                                ),
                                hintStyle: const TextStyle(
                                  color: DColors.textSecondaryColor,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                filled: true,
                                fillColor: DColors.textFieldColor,
                                hintText: DTexts.confirmPasswordSignUp,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: DColors.primaryColor,
                                  ),
                                ),
                                hintStyle: const TextStyle(
                                  color: DColors.textSecondaryColor,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Checkbox.adaptive(
                            value: true,
                            onChanged: (value) {},
                            splashRadius: 20,
                          ),
                          const Text(
                            DTexts.remember,
                            style: TextStyle(
                              color: DColors.textFieldColor,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(25),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DColors.lightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          DTexts.loginButtonText,
                          style: TextStyle(
                            color: DColors.textFieldColor,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const Gap(8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        DTexts.newUser,
                        style: DStyle.smallHeadingText,
                      ),
                    ),
                    const Gap(25),
                    const Text(
                      DTexts.or,
                      style: TextStyle(
                        color: DColors.borderPrimary,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/Facebook.png'),
                        const Gap(10),
                        Container(
                          height: 50,
                          width: 3,
                          color: Colors.black,
                        ),
                        const Gap(10),
                        Image.asset('assets/icons/Google Plus.png')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: use_build_context_synchronously, unused_field, avoid_print

import 'package:anime_app/screen/home_screen/home_screen.dart';
import 'package:anime_app/widgets/auth/signup/remember_me.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../bottom_navbar.dart';
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

class SignUpPageContainer extends StatefulWidget {
  const SignUpPageContainer({
    super.key,
  });

  @override
  State<SignUpPageContainer> createState() => _SignUpPageContainerState();
}

class _SignUpPageContainerState extends State<SignUpPageContainer> {
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  String email = '';
  String password = '';
  String fullName = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  registration() async {
    if (emailController.text != "" &&
        confirmPasswordController.text != "null") {
      try {
        UserCredential usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Successful'),
          ),
        );
        print('usercredential: $usercredential');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppHomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The password provided is too weak.'),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The account already exists for that email.'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred'),
          ),
        );
      }
    }
  }

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
      child: Column(
        children: [
          const Gap(60),
          const Heading(text: DTexts.signUpHeading, style: DStyle.loginHeading),
          const SubHeading(
            subHeading: DTexts.signUpSubHeading,
            style: DStyle.smallboldlightbuttonText,
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInte
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: DColors.textFieldColor,
                        hintText: DTexts.loginEmailField,
                        hintStyle: DStyle.textField,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: DColors.textFieldColor,
                        hintText: DTexts.passwordSignUp,
                        hintStyle: DStyle.textField,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: DColors.textFieldColor,
                        hintText: DTexts.confirmPasswordSignUp,
                        hintStyle: DStyle.textField,
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
          ),
          const SignUpRememberMe(),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: 50,
              width: DHelperFunctions.screenHeight(context) * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    setState(() {
                      email = emailController.text;
                      password = passwordController.text;
                      fullName = confirmPasswordController.text;
                    });
                  }
                  registration();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DColors.lightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  DTexts.signUpButtonText,
                  style: DStyle.smallboldlightbuttonText,
                ),
              ),
            ),
          ),
          const Gap(8),
          const DontHaveAnAccount(text: DTexts.newUser),
          const Gap(25),
          const ContinueWithText(),
          const Gap(20),
          const SocialIcons(),
        ],
      ),
    );
  }
}

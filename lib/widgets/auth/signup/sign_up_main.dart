// ignore_for_file: use_build_context_synchronously, unused_field, avoid_print, library_private_types_in_public_api

import 'package:anime_app/screen/home_screen/home_screen.dart';
import 'package:anime_app/widgets/auth/signup/remember_me.dart';
import 'package:anime_app/widgets/auth/signup/signup_textform_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';
import '../common/continue_with_google.dart';
import '../common/heading_text.dart';
import '../common/social_icons.dart';
import '../common/subheading.dart';
import '../login/dont_have_an_accnt.dart';

class SignUpPageContainer extends StatefulWidget {
  const SignUpPageContainer({
    super.key,
  });

  @override
  _SignUpPageContainerState createState() => _SignUpPageContainerState();
}

class _SignUpPageContainerState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _containerAnimation;
  late Animation<double> _textFieldAnimation;

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

    _textFieldAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeInOutCirc),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    // Dispose of TextEditingController
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

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
        child: Column(
          children: [
            const Gap(60),
            const Heading(
                text: DTexts.signUpHeading, style: DStyle.loginHeading),
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
                child: SignUpTextFormSection(textFieldAnimation: _textFieldAnimation, emailController: emailController, emailRegex: emailRegex, passwordController: passwordController, confirmPasswordController: confirmPasswordController),
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
      ),
    );
  }
}


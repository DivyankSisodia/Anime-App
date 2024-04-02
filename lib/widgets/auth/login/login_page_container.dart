// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_print

import 'package:anime_app/widgets/auth/common/isRegister.dart';
import 'package:anime_app/widgets/auth/common/login_btn.dart';
import 'package:anime_app/widgets/auth/login/forgot_password.dart';
import 'package:anime_app/widgets/auth/login/login_form_section.dart';
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
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _formkey = GlobalKey<FormState>();

    userLogin() async {
      if (_formkey.currentState!.validate()) {
        try {
          // Attempt login
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Navigate to the home screen on successful login
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 900),
              reverseTransitionDuration: const Duration(milliseconds: 600),
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
                  child: const Authpage(),
                );
              },
            ),
          );
        } on FirebaseAuthException catch (e) {
          print('Error occurred: ${e.message}');
          // Show error message on SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Center(
                child: Text(
                  'Invalid Email or Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }
      }
    }

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
            const Gap(70),
            const Heading(
              text: DTexts.loginHeading,
              style: DStyle.loginHeading,
            ),
            const SubHeading(
              subHeading: DTexts.loginSubHeading,
              style: DStyle.smallboldlightbuttonText,
            ),
            const Gap(60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LoginTextFormFieldSection(
                  formkey: _formkey,
                  textFieldAnimation: _textFieldAnimation,
                  emailController: emailController,
                  emailRegex: emailRegex,
                  passwordController: passwordController),
            ),
            const ForgotPasswordOrRememberMe(),
            const Gap(30),
            GestureDetector(
              child: const AuthButton(buttonText: DTexts.loginButtonText),
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(
                    () {
                      email = emailController.text;
                      password = passwordController.text;
                    },
                  );
                }
                userLogin();
              },
            ),
            const Gap(8),
            const DontHaveAnAccount(text: DTexts.or),
            const Gap(30),
            const ContinueWithText(),
            const Gap(20),
            const SocialIcons()
          ],
        ),
      ),
    );
  }
}

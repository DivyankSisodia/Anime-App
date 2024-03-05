import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/auth/signup/sign_up_main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.lightColor,
      appBar: AppBar(
        backgroundColor: DColors.lightColor,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Image.asset(
            'assets/icons/Up Arrow.png',
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: SignUpPageContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

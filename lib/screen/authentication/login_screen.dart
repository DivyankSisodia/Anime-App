import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/auth/login/login_page_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      body: const SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: LoginPageContainer(),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'screen/login_screen.dart';
import 'screen/signup_screen.dart';
import 'screen/splashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
    );
  }
}

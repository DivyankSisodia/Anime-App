import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // child: Text(
          //   'Hello World!',
          //   style: GoogleFonts.poppins(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
          child: Image.asset(
            'assets/images/Home_image.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

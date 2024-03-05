import 'package:flutter/material.dart';

import '../../../bottom_navbar.dart';
import '../../../utils/constants/style.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomNavbar(),
          ),
        );
      },
      child: Text(
        text,
        style: DStyle.smallHeadingText,
      ),
    );
  }
}

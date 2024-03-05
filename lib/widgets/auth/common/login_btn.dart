import 'package:flutter/material.dart';

import '../../../bottom_navbar.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key, required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomBottomNavbar(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: DColors.lightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          buttonText,
          style: DStyle.smallboldlightbuttonText,
        ),
      ),
    );
  }
}

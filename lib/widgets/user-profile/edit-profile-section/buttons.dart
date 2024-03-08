import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key, required this.text, required this.color, required this.boxShadow, required this.onPressed,
  });

  final String text;
  final Color color;
  final Color boxShadow;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: boxShadow,
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
            color: DColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

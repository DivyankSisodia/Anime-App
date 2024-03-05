import 'package:flutter/material.dart';


class Heading extends StatelessWidget {
  const Heading({
    super.key, required this.text, required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        style: style
      ),
    );
  }
}

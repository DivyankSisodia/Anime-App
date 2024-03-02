import 'package:flutter/material.dart';


class TitleORHeading extends StatelessWidget {
  const TitleORHeading({
    super.key,
    required this.title, required this.fontstyle,
  });

  final String title;
  final TextStyle fontstyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: fontstyle,
    );
  }
}

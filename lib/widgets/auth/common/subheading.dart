import 'package:flutter/material.dart';


class SubHeading extends StatelessWidget {
  const SubHeading({
    super.key, required this.subHeading, required this.style,
  });

  final String subHeading;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      subHeading,
      style: style,
    );
  }
}

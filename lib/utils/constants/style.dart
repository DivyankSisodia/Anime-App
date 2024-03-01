import 'package:anime_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DStyle {
  // ignore: constant_identifier_names
  static const mainHeading = TextStyle(
    color: DColors.splashColor,
    fontSize: 40,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w900,
  );

  static const lightbuttonText = TextStyle(
    color: DColors.textlightColor,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const smalllightbuttonText = TextStyle(
    color: DColors.pureWhite,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const mediumbuttonText = TextStyle(
    color: DColors.textlightColor,
    fontSize: 22,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
  );

  static const darkbuttonText = TextStyle(
    color: DColors.backgroundColor,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const smallHeadingText = TextStyle(
    color: DColors.textFieldColor,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}

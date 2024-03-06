import 'package:anime_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DStyle {
  // ignore: constant_identifier_names
  static const largeHeading = TextStyle(
    color: DColors.splashColor,
    fontSize: 40,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w900,
  );

  static const loginHeading = TextStyle(
    color: DColors.textFieldColor,
    fontSize: 35,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
  );

  static const mediumlargeHeading = TextStyle(
    color: DColors.pureWhite,
    fontSize: 30,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static const mediumHeading = TextStyle(
    color: DColors.pureWhite,
    fontSize: 26,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static const smallHeading = TextStyle(
    color: DColors.pureWhite,
    fontSize: 25,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const textField = TextStyle(
    color: DColors.textSecondaryColor,
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
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
  static const smallboldlightbuttonText = TextStyle(
    color: DColors.pureWhite,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
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

  static const bottomNavbarText = TextStyle(
    color: DColors.pureWhite,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const descriptionText = TextStyle(
    color: Color.fromARGB(255, 220, 220, 220),
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
  );

  static const smalllightbuttonDarkFontText = TextStyle(
    color: DColors.pureWhite,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static final highlightedText = const TextStyle(
    color: Colors.blueAccent,
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  ).copyWith(
    decoration: TextDecoration.underline,
    decorationColor: Colors.blueAccent,
    decorationThickness: 3,
  );

  static const misctext = TextStyle(
    color: DColors.textFieldColor,
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const miscText2 = TextStyle(
    color: DColors.borderPrimary,
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w200,
  );

  static const miscText3 = TextStyle(
    color: Colors.blueAccent,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w900,
  );
}

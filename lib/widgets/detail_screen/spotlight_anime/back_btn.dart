import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class SpotLightBackButton extends StatelessWidget {
  const SpotLightBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: DHelperFunctions.screenWidth(context) * 0.66,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/icons/Back To.png',
          color: DColors.pureWhite,
        ),
      ),
    );
  }
}

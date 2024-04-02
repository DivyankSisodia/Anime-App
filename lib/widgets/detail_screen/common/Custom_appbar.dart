import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DColors.backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/icons/Up Arrow.png',
          color: DColors.pureWhite,
        ),
      ),
    );
  }
}

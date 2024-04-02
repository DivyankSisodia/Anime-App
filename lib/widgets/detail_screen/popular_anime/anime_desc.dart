import 'package:flutter/material.dart';

import '../../../utils/constants/style.dart';

class AnimeDescText extends StatelessWidget {
  const AnimeDescText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        maxLines: 3,
        style: DStyle.misctext6,
      ),
    );
  }
}

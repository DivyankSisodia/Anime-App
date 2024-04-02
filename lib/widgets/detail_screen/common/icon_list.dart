import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class IconListWidget extends StatelessWidget {
  const IconListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/icons/Plus Math.png',
              color: DColors.pureWhite,
              height: 35,
              width: 90,
            ),
            const Text(
              'Add',
              style: DStyle.misctext6,
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/icons/Facebook Like.png',
              color: DColors.pureWhite,
              height: 35,
              width: 90,
            ),
            const Text(
              'Like',
              style: DStyle.misctext6,
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/icons/Share.png',
              color: DColors.pureWhite,
              height: 35,
              width: 90,
            ),
            const Text(
              'Share',
              style: DStyle.misctext6,
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/icons/People.png',
              color: DColors.pureWhite,
              height: 35,
              width: 90,
            ),
            const Text(
              'add',
              style: DStyle.misctext6,
            )
          ],
        )
      ],
    );
  }
}

class EspidodeListDropDown extends StatelessWidget {
  const EspidodeListDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Episodes', style: DStyle.misctext6),
          Row(
            children: [
              const Text(
                '1-15',
                style: DStyle.misctext5,
              ),
              DropdownButton(items: const [
                DropdownMenuItem(
                  value: '1',
                  child: Text('1-15'),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text('15-30'),
                ),
                DropdownMenuItem(
                  value: '3',
                  child: Text('30-45'),
                ),
              ], onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}

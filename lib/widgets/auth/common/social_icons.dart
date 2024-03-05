import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/icons/Facebook.png'),
        const Gap(10),
        Container(
          height: 50,
          width: 3,
          color: Colors.black,
        ),
        const Gap(10),
        Image.asset('assets/icons/Google Plus.png')
      ],
    );
  }
}

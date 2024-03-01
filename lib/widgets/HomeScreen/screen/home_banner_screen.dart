import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/home_image.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 80,
              left: 10,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Text(
                        DTexts.action,
                        style: DStyle.smalllightbuttonText,
                      ),
                      Gap(25),
                      Text(
                        DTexts.drama,
                        style: DStyle.smalllightbuttonText,
                      ),
                      Gap(25),
                      Text(
                        DTexts.adventure,
                        style: DStyle.smalllightbuttonText,
                      ),
                      Gap(25),
                      Text(
                        DTexts.thriller,
                        style: DStyle.smalllightbuttonText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 20,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/Plus Math.png',
                      color: DColors.pureWhite,
                      height: 30,
                      width: 80,
                    ),
                    const Text(
                      DTexts.mylist,
                      style: DStyle.smalllightbuttonText,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 20,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/Info.png',
                      color: DColors.pureWhite,
                      height: 30,
                      width: 80,
                    ),
                    const Text(
                      DTexts.info,
                      style: DStyle.smalllightbuttonText,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 2,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/image 1.png',
                      color: DColors.pureWhite,
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      'assets/icons/Search.png',
                      color: DColors.pureWhite,
                      height: 30,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.35,
              bottom: 10,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                  color: DColors.lightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    DTexts.play,
                    style: DStyle.mediumbuttonText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

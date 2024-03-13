import 'package:anime_app/screen/onboarding_screen/card_data.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../authentication/splashScreen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final data = [
    CardData(
      title: 'AnimeLand',
      description: 'Explore the world of anime',
      image: LottieBuilder.asset(
        'assets/lottie/Animation - 1710077718387.json',
        repeat: true,
      ),
      backgroundColor: DColors.backgroundColor,
      titleColor: Colors.blueAccent,
      descriptionColor: DColors.pureWhite,
    ),
    CardData(
      title: 'Welcome to Your\n   Anime Haven',
      description: 'Your Gateway to Anime Bliss',
      image: LottieBuilder.asset(
        'assets/lottie/Animation - 1710080645677.json',
        fit: BoxFit.cover,
        repeat: true,
      ),
      backgroundColor: Colors.yellow.shade800,
      titleColor: const Color.fromARGB(255, 246, 246, 246),
      descriptionColor: DColors.pureWhite,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: data.length,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemBuilder: (int index) {
          return CardUIView(data: data[index]);
        },
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

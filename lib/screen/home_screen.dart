import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants/colors.dart';
import '../widgets/HomeScreen/view/widgets/anime_services.dart';
import '../widgets/HomeScreen/view/widgets/home_banner_screen.dart';

class AppHomeScreen extends ConsumerWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: DHelperFunctions.screenHeight(context),
          width: DHelperFunctions.screenWidth(context),
          child: const Column(
            children: [
              // Image banner and buttons
              HomeBanner(),

              // Anime lists from API and their categories
              AnimeServices(),
            ],
          ),
        ),
      ),
    );
  }
}

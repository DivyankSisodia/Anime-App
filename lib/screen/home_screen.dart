import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants/colors.dart';
import '../widgets/HomeScreen/view/widgets/anime_services.dart';
import '../widgets/HomeScreen/view/widgets/home_banner_screen.dart';

class AppHomeScreen extends ConsumerWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: Column(
        children: [

          // Image banner and buttons
          HomeBanner(),

          // Anime lists from API and their categories
          AnimeServices(),
        ],
      ),
    );
  }
}





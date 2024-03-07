import 'package:anime_app/screen/detail_page/spotlight-anime_detail_page.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/Home Page/api_data_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../common/anime_card.dart';
import '../../common/loading_effect.dart';

class SpotlightAnimeCard extends ConsumerWidget {
  const SpotlightAnimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final animeList = ref.watch(spotLightProvider);
        return animeList.when(
          data: (animeData) {
            return Container(
              height: DHelperFunctions.screenHeight(context) * 0.209,
              width: double.infinity,
              color: DColors.backgroundColor,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: animeData.length,
                itemBuilder: (context, index) {
                  final anime = animeData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: AnimeDetailScreen(anime: anime),
                          );
                        },
                      ));
                    },
                    child: AnimeCard(anime: anime),
                  );
                },
              ),
            );
          },
          loading: () => const LoadingEffect(),
          error: (error, stackTrace) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            height: DHelperFunctions.screenHeight(context) * 0.109,
            width: DHelperFunctions.screenWidth(context) / 1.5,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: $error',
                    style: DStyle.bottomNavbarText,
                  ),
                  const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/Home Page/api_data_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../common/anime_card.dart';
import '../../common/loading_effect.dart';

class PopularAnimeCard extends ConsumerWidget {
  const PopularAnimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final animeList = ref.watch(topAnimeListProvider);
        return animeList.when(
          data: (animeData) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: DHelperFunctions.screenHeight(context) * 0.209,
                width: double.infinity,
                color: DColors.backgroundColor,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: animeData.length,
                  itemBuilder: (context, index) {
                    final anime = animeData[index];
                    return AnimeCard(anime: anime);
                  },
                ),
              ),
            );
          },
          loading: () => const LoadingEffect(),
          error: (error, stackTrace) => Text('Error: $error'),
        );
      },
    );
  }
}

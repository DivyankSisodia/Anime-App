
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/api_data_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../common/anime_card.dart';
import '../../common/loading_effect.dart';

class CardsInfo extends ConsumerWidget {
  const CardsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final animeList = ref.watch(animeListProvider);
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
                  return AnimeCard(anime: anime);
                },
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
import 'package:anime_app/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:gap/gap.dart';

import '../../controller/my_list_controller.dart';
import '../../widgets/favorites/screen/default_bg_screen.dart';

class UnWatchedAnimePage extends ConsumerWidget {
  const UnWatchedAnimePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedAnime = ref.watch(unWatchedAnimeProvider);

    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: watchedAnime.isEmpty
          ? const DefaultLoadedScreen()
          : ListView.builder(
              itemCount: watchedAnime.length,
              itemBuilder: (context, index) {
                final anime = watchedAnime[index];
                return Card(
                  color: DColors.backgroundColor,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: DColors.searchTileColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: anime.poster,
                              height: 180,
                              width: 180,
                              fit: BoxFit
                                  .cover, // Ensure the image covers the rounded area
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rank : ${anime.rank.toString()}',
                                    style: DStyle.mediumHeading,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(unWatchedAnimeProvider.notifier)
                                          .removeFromUnWatched(anime.id);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Text(
                                anime.name,
                                maxLines: 1,
                                style: DStyle.lightbuttonText,
                              ),
                              const Gap(5),
                              Text(
                                anime.description,
                                maxLines: 2,
                                style: DStyle.smalllightbuttonText,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

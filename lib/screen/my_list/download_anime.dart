import 'package:anime_app/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:gap/gap.dart';

import '../../controller/my list/my_list_controller.dart';
import '../../utils/constants/text_strings.dart';
import '../../widgets/favorites/screen/default_bg_screen.dart';

class DownloadAnimePage extends ConsumerWidget {
  const DownloadAnimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadAnime = ref.watch(downloadedAnimeProvider);

    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: downloadAnime.isEmpty
          ? const DefaultLoadedScreen(
              image: 'assets/images/Ellipse 20.png',
              title: DTexts.noDownloadContent,
              subTitle: DTexts.noDownloadContentSub,
              buttonText: DTexts.browseAll,
            )
          : ListView.builder(
              itemCount: downloadAnime.length,
              itemBuilder: (context, index) {
                final anime = downloadAnime[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: DColors.backgroundColor,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: DColors.searchTileColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: DColors.pureWhite,
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: anime.poster,
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Rank : ${anime.rank.toString()}',
                                      style: DStyle.mediumHeading,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(downloadedAnimeProvider
                                                .notifier)
                                            .removeFromDownloaded(anime.id);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30,
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
                  ),
                );
              },
            ),
    );
  }
}

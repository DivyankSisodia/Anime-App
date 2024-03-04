import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:gap/gap.dart';

import '../controller/my_list_controller.dart';

class WatchedAnimePage extends ConsumerWidget {
  const WatchedAnimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedAnime = ref.watch(watchedAnimeProvider);

    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: watchedAnime.isEmpty
          ? Container(
              height: DHelperFunctions.screenHeight(context),
              width: DHelperFunctions.screenWidth(context),
              color: DColors.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Ellipse 18.png'),
                  const Gap(1),
                  const Text(
                    DTexts.noUnwatchedContent,
                    style: DStyle.mediumHeading,
                  ),
                  const Gap(2),
                  const Text(
                    DTexts.noUnwatchedContentSub,
                    style: DStyle.smallHeadingText,
                  ),
                  const Gap(10),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: DColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        DTexts.newList,
                        style: DStyle.smallboldlightbuttonText,
                      ),
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: watchedAnime.length,
              itemBuilder: (context, index) {
                final anime = watchedAnime[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: DColors.backgroundColor,
                    child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: DColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
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
                                              .read(
                                                  watchedAnimeProvider.notifier)
                                              .removeFromWatched(anime.id);
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
                        )),
                  ),
                );
              },
            ),
    );
  }
}

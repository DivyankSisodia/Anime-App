// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';

import '../../controller/my_list_controller.dart';
import '../../utils/helper/helper_functions.dart';

final isDescExpandedProvider = StateProvider((ref) => false);
final isJTitleExpandedProvider = StateProvider((ref) => false);

class AnimeDetailScreen extends ConsumerWidget {
  const AnimeDetailScreen({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
              child: Stack(
                children: [
                  AnimeImage(anime: anime),
                  const BackButton(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 100,
              color: DColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WatchedButton(anime: anime),
                  const Gap(10),
                  UnWatchedButton(anime: anime),
                  const Gap(10),
                  const DownloadButton()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: DColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DColors.lighterColor,
                      blurRadius: 14,
                      spreadRadius: 8,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          anime.name,
                          style: DStyle.mediumbuttonText,
                        ),
                        const Gap(10),
                        Text(
                          anime.jname,
                          style: DStyle.smallHeading,
                        ),
                        const Gap(10),
                        Consumer(
                          builder: (context, watch, _) {
                            final isDescExpanded =
                                ref.watch(isDescExpandedProvider);
                            return Text(
                              anime.description,
                              style: DStyle.smalllightbuttonText,
                              maxLines:
                                  isDescExpanded ? anime.description.length : 3,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            ref.read(isDescExpandedProvider.notifier).state =
                                !ref
                                    .read(isDescExpandedProvider.notifier)
                                    .state;
                          },
                          child: Text(
                            ref.read(isDescExpandedProvider.notifier).state
                                ? "Read Less"
                                : "Read More",
                            style: DStyle.highlightedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: DColors.lighterColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            DTexts.download,
            style: DStyle.smalllightbuttonDarkFontText,
          ),
        ),
      ),
    );
  }
}

class UnWatchedButton extends StatelessWidget {
  const UnWatchedButton({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Consumer(
        builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(unWatchedAnimeProvider.notifier).addToUnWatched(anime);
              DHelperFunctions.showSnackBar(context, 'Added to Unwatched List');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: DColors.lighterColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  DTexts.unWatched,
                  style: DStyle.smalllightbuttonDarkFontText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WatchedButton extends StatelessWidget {
  const WatchedButton({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Consumer(
        builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(watchedAnimeProvider.notifier).addToWatched(anime);
              DHelperFunctions.showSnackBar(context, 'Added to Watched List');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: DColors.lighterColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  DTexts.watched,
                  style: DStyle.smalllightbuttonDarkFontText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: DHelperFunctions.screenWidth(context) * 0.66,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/icons/Back To.png',
          color: DColors.pureWhite,
        ),
      ),
    );
  }
}

class AnimeImage extends StatelessWidget {
  const AnimeImage({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: NetworkImage(anime.poster),
        fit: BoxFit.cover,
        height: DHelperFunctions.screenHeight(context) * 0.6,
      ),
    );
  }
}

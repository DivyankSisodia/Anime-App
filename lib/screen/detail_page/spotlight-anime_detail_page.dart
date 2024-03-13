// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/utils/constants/colors.dart';

import '../../widgets/detail_screen/common/button_section.dart';
// ignore: unused_import
import '../../widgets/detail_screen/common/download_btn.dart';
import '../../widgets/detail_screen/common/unwatched_btn.dart';
import '../../widgets/detail_screen/common/watched_btn.dart';
import '../../widgets/detail_screen/spotlight_anime/Container_text_section.dart';
import '../../widgets/detail_screen/spotlight_anime/anime_image.dart';
import '../../widgets/detail_screen/spotlight_anime/back_btn.dart';

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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
              child: Stack(
                children: [
                  AnimeImage(anime: anime),
                  const SpotLightBackButton(),
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
                  DownloadedButton(anime: anime),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextContainerSection(anime: anime),
            ),
          ),
          const ButtonSection()
        ],
      ),
    );
  }
}


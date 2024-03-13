import 'package:flutter/material.dart';
import 'package:anime_app/utils/constants/colors.dart';

import '../../model/fav_anime_model.dart';
import '../../widgets/detail_screen/common/Custom_appbar.dart';
import '../../widgets/detail_screen/common/divider_widget.dart';
import '../../widgets/detail_screen/common/epsiode_list.dart';
import '../../widgets/detail_screen/fav_anime/image_section.dart';
import '../../widgets/detail_screen/fav_anime/text_details.dart';

class FavAnimeDetailScreen extends StatelessWidget {
  final FavAnime anime;

  const FavAnimeDetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ImageSection(anime: anime),
              AnimeTextDetails(anime: anime),
              const DividerSection(),
              const EpisodeListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

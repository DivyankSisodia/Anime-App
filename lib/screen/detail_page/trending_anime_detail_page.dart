// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:anime_app/widgets/detail_screen/common/Custom_appbar.dart';
import 'package:anime_app/widgets/detail_screen/common/button_section.dart';
import 'package:anime_app/widgets/detail_screen/common/divider_widget.dart';
import 'package:anime_app/widgets/detail_screen/common/epsiode_list.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/utils/constants/colors.dart';

import '../../widgets/detail_screen/common/icon_list.dart';
import '../../widgets/detail_screen/popular_anime/anime_desc.dart';
import '../../widgets/detail_screen/popular_anime/anime_name_text_section.dart';
import '../../widgets/detail_screen/popular_anime/image_container.dart';

class TrendingOrPopularAnimeDetailScreen extends StatefulWidget {
  const TrendingOrPopularAnimeDetailScreen({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  _TrendingOrPopularAnimeDetailScreen createState() =>
      _TrendingOrPopularAnimeDetailScreen();
}

class _TrendingOrPopularAnimeDetailScreen
    extends State<TrendingOrPopularAnimeDetailScreen> {
  bool isexpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: DHelperFunctions.screenHeight(context),
          child: Column(
            children: [
              ImageContainer(widget: widget),
              AnimeNameText(widget: widget),
              const Expanded(
                flex: 5,
                child: Column(
                  children: [
                    AnimeDescText(),
                    ButtonSection(),
                    IconListWidget(),
                    EspidodeListDropDown(),
                    DividerSection(),
                    EpisodeListWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








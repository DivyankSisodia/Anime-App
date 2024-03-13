import 'package:anime_app/widgets/detail_screen/common/divider_widget.dart';
import 'package:anime_app/widgets/detail_screen/common/epsiode_list.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/utils/constants/colors.dart';

import '../../model/movie_model.dart';
import '../../widgets/detail_screen/anime_movie/movie_image_section.dart';
import '../../widgets/detail_screen/anime_movie/movie_text_section.dart';
import '../../widgets/detail_screen/common/Custom_appbar.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

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
              MovieImageSection(movie: movie),
              MovieTextDetail(movie: movie),
              const DividerSection(),
              const EpisodeListWidget()
            ],
          ),
        ),
      ),
    );
  }
}



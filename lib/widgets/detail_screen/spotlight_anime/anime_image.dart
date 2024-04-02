import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../model/anime_model.dart';

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

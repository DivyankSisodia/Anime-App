import 'package:flutter/material.dart';

import '../../../model/fav_anime_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class AnimeTextDetails extends StatelessWidget {
  const AnimeTextDetails({
    super.key,
    required this.anime,
  });

  final FavAnime anime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: DColors.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            anime.name,
            style: DStyle.smalllightbuttonDarkFontText,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Year: ${anime.duration}',
                style: DStyle.misctext5,
              ),
              const SizedBox(width: 10),
              const Text(
                'Age Rating: 13+',
                style: DStyle.misctext5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../model/fav_anime_model.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.anime,
  });

  final FavAnime anime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(anime.poster),
                fit: BoxFit.cover,
                // height: 210,
                width: double.infinity,
              ),
              const Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

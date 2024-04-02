import 'package:flutter/material.dart';

import '../../../screen/detail_page/trending_anime_detail_page.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.widget,
  });

  final TrendingOrPopularAnimeDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(widget.anime.poster),
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

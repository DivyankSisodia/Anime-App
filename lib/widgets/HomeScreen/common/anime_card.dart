import 'package:flutter/material.dart';
import '../../../model/anime_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: DColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${anime.name}-${anime.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: Image.network(
                  anime.poster,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                anime.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: DStyle.smallHeadingText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

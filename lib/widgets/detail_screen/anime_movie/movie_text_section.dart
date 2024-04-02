import 'package:flutter/material.dart';

import '../../../model/movie_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class MovieTextDetail extends StatelessWidget {
  const MovieTextDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

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
            movie.name,
            style: DStyle.smalllightbuttonDarkFontText,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Duration: ${movie.duration}',
                style: DStyle.misctext5,
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Age Rating: ${movie.rating}',
                  style: DStyle.misctext5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:anime_app/widgets/detail_screen/popular_anime/additional_info_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../screen/detail_page/trending_anime_detail_page.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class AnimeNameText extends StatelessWidget {
  const AnimeNameText({
    super.key,
    required this.widget,
  });

  final TrendingOrPopularAnimeDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 2,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: DColors.backgroundColor,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.anime.name,
                  style: DStyle.smalllightbuttonDarkFontText,
                ),
              ),
              const Gap(5),
              const Expanded(
                child: AdditionalInfoText(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

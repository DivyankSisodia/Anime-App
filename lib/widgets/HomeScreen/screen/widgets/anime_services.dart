import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../utils/constants/style.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../common/card_container.dart';
import '../../common/text_heading.dart';
import '../../common/view_all_heading.dart';
import '../data/popular_anime_card.dart';

class AnimeServices extends ConsumerWidget {
  const AnimeServices({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              TitleORHeading(
                  title: DTexts.freeToWatch, fontstyle: DStyle.mediumHeading),
              Gap(10),
              DisplayCardContainer(), // For trending anime
              Gap(15),
              viewAllHeading(),
              Gap(10),
              PopularAnimeCard(), // For top upcoming anime
            ],
          ),
        ),
      ),
    );
  }
}

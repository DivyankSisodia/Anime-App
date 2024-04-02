import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/my list/my_list_controller.dart';
import '../../../model/anime_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';

class UnWatchedButton extends StatelessWidget {
  const UnWatchedButton({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Consumer(
        builder: (context, ref, child) {
          return GestureDetector(
            onTap: () {
              ref.read(unWatchedAnimeProvider.notifier).addToUnWatched(anime);
              DHelperFunctions.showSnackBar(context, 'Added to Unwatched List');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: DColors.lighterColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  DTexts.unWatched,
                  style: DStyle.smalllightbuttonDarkFontText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/my list/my_list_controller.dart';
import '../../../model/anime_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_functions.dart';

class DownloadedButton extends ConsumerWidget {
  const DownloadedButton({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 7,
      child: Consumer(
        builder: (context, watch, child) {
          return GestureDetector(
            onTap: () {
              ref.read(downloadedAnimeProvider.notifier).addToDownloaded(anime);
              DHelperFunctions.showSnackBar(
                  context, 'Added to Download Section');
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                color: DColors.lighterColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: const Center(
                child: Text(
                  DTexts.download,
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

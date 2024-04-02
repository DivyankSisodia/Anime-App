import 'package:anime_app/widgets/detail_screen/common/download_anime.dart';
import 'package:anime_app/widgets/detail_screen/common/play_btn.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: Row(
          children: [
            PlayButton(),
            Gap(20),
            DownloadAnimeButton(),
          ],
        ),
      ),
    );
  }
}

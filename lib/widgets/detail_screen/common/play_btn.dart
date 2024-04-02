import 'package:flutter/material.dart';

import '../../../screen/video-Player/video_player.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        height: 60,
        width: 153,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 107, 90, 163),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              blurRadius: 5,
              spreadRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VideoScreen(),
              ),
            );
          },
          child: const Center(
            child: Text(
              DTexts.play,
              style: DStyle.lightbuttonText,
            ),
          ),
        ),
      ),
    );
  }
}

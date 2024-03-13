// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoScreen extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoScreen({super.key, required this.controller});

  @override
  _FullScreenVideoScreenState createState() => _FullScreenVideoScreenState();
}

class _FullScreenVideoScreenState extends State<FullScreenVideoScreen> {
  late VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
    widget.controller.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.controller.value.isPlaying) {
              widget.controller.pause();
            } else {
              widget.controller.play();
            }
          });
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RotatedBox(
                quarterTurns: 1, // Rotate the video by 90 degrees
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: widget.controller.value.aspectRatio,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 20),
              child: RotatedBox(
                quarterTurns: 1,
                child: VideoProgressIndicator(
                  widget.controller,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Color.fromARGB(255, 199, 199, 199),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.fullscreen_exit,
                  color: DColors.pureWhite,
                  size: 40,
                ),
              ),
            ),
            if (widget.controller.value.isPlaying)
              SizedBox(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.controller.value.isPlaying) {
                        widget.controller.pause();
                      } else {
                        widget.controller.play();
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    // color: DColors.pureWhite,
                    size: 50.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listener);
  }
}

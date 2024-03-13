// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:anime_app/screen/video-Player/fullscreen_video.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import '../../utils/constants/style.dart';
import '../../widgets/HomeScreen/view/widgets/anime_services.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  String apiUrl =
      'https://api-aniwatch.onrender.com/anime/episode-srcs?id=one-piece-100?ep=1076&server=vidstreaming&category=dub';

  @override
  void initState() {
    super.initState();
    _fetchVideoUrl();
  }

  Future<void> _fetchVideoUrl() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Parse the response to get the video URL
        dynamic jsonData = jsonDecode(response.body);
        String videoUrl = jsonData['sources'][0]['url'];

        // Initialize the video player controller
        _controller = VideoPlayerController.network(videoUrl);

        // Load the video and initialize playback
        _initializeVideoPlayerFuture = _controller!.initialize();
        setState(() {});
      } else {
        throw Exception('Failed to load video');
      }
    } catch (e) {
      print('Error fetching video URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5,
        title: const Text(
          'Video is Streaming, Enjoy!!',
          style: DStyle.mediumbuttonText,
        ),
      ),
      body: Center(
        child: _controller != null
            ? FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, display the video
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                _controller!.play();
                              }
                            });
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!),
                              ),
                              VideoProgressIndicator(
                                _controller!,
                                allowScrubbing: true,
                                colors: const VideoProgressColors(
                                  playedColor: Colors.red,
                                  bufferedColor:
                                      Color.fromARGB(255, 199, 199, 199),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Positioned(
                                right: 8.0,
                                bottom: 2.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // Navigate to fullscreen page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FullScreenVideoScreen(
                                            controller: _controller!,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.fullscreen,
                                      color: DColors.pureWhite,
                                    ),
                                  ),
                                ),
                              ),
                              // Play/Pause icon
                              if (!_controller!.value.isPlaying)
                                Positioned(
                                  top: 90,
                                  left: 160,
                                  child: SizedBox(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_controller!.value.isPlaying) {
                                            _controller!.pause();
                                          } else {
                                            _controller!.play();
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: DColors.pureWhite,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Gap(30),
                        const AnimeServices(),
                      ],
                    );
                  } else {
                    // Otherwise, display a loading spinner
                    return const CircularProgressIndicator();
                  }
                },
              )
            : const Text('Loading video...'),
      ),
    );
  }
}

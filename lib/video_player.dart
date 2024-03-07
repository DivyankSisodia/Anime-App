import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  String apiUrl =
      'https://api-aniwatch.onrender.com/anime/episode-srcs?id=steinsgate-3?ep=230&server=vidstreaming&category=dub';

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
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: _controller != null
            ? FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, display the video
                    return AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    );
                  } else {
                    // Otherwise, display a loading spinner
                    return const CircularProgressIndicator();
                  }
                },
              )
            : const Text('Loading video...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Play/Pause the video when FAB is pressed
          setState(() {
            if (_controller!.value.isPlaying) {
              _controller!.pause();
            } else {
              _controller!.play();
            }
          });
        },
        child: Icon(
          _controller != null && _controller!.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources
    _controller?.dispose();
    super.dispose();
  }
}

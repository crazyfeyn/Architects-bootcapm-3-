import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController youTubeController;
  bool _isControllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isControllerInitialized) {
      String video = ModalRoute.of(context)!.settings.arguments as String;
      String initialVideoId = YoutubePlayer.convertUrlToId(video) ?? "";
      youTubeController = YoutubePlayerController(
        initialVideoId: initialVideoId,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
      _isControllerInitialized = true;
    }
  }

  @override
  void dispose() {
    youTubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      appBar: AppBar(
        title: const Text(
          'Course video',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: youTubeController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              youTubeController.addListener(() {});
            },
          ),
        ],
      ),
    );
  }
}

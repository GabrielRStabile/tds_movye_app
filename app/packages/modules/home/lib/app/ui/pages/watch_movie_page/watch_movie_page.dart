import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_video_entity.dart';

class WatchMoviePage extends StatefulWidget {
  const WatchMoviePage({
    required this.movieVideo,
    required this.movieName,
    super.key,
  });

  final MovieVideoEntity movieVideo;
  final String movieName;

  @override
  State<WatchMoviePage> createState() => _WatchMoviePageState();
}

class _WatchMoviePageState extends State<WatchMoviePage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.movieVideo.key,
      flags: const YoutubePlayerFlags(
        forceHD: true,
        hideThumbnail: true,
        captionLanguage: 'pt',
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      topActions: [
        const SizedBox(width: 64),
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        Text(
          widget.movieName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
      bottomActions: [
        const SizedBox(width: 64),
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
            playedColor: Color(0xFF806BFF),
            handleColor: Color(0xFF806BFF),
          ),
        ),
        RemainingDuration(),
        const SizedBox(width: 64),
      ],
    );
  }
}

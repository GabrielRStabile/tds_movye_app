import 'dart:async';

import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/app/domain/entities/movie_video_entity.dart';
import 'package:home/app/main/factories/get_movie_videos_factory.dart';
import 'package:home/app/ui/pages/watch_movie_page/watch_movie_page.dart';

class WatchMoviePageBuilder extends StatefulWidget {
  const WatchMoviePageBuilder({
    required this.movieId,
    required this.movieName,
    super.key,
  });

  final int movieId;
  final String movieName;

  @override
  State<WatchMoviePageBuilder> createState() => _WatchMoviePageBuilderState();
}

class _WatchMoviePageBuilderState extends State<WatchMoviePageBuilder> {
  late final Future<List<MovieVideoEntity>> getVideo;

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() async {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    getVideo = GetMovieVideosFactory().call(widget.movieId);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    scheduleMicrotask(() async {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
        ],
      );
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVideoEntity>>(
      future: getVideo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WatchMoviePage(
            movieName: widget.movieName,
            movieVideo: snapshot.data!.firstWhere(
              (video) => video.name.contains('Dublado'),
              orElse: () => snapshot.data!.first,
            ),
          );
        } else if (snapshot.hasError) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Oops, não conseguimos reproduzir esse vídeo :('),
                const SizedBox(height: 16),
                ButtonAtom.primary(
                  onPressed: () => Navigator.of(context).pop(),
                  label: 'Voltar',
                )
              ],
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

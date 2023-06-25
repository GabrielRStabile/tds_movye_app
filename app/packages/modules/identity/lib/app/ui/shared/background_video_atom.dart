import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BackgroundVideoAtom extends StatefulWidget {
  const BackgroundVideoAtom({super.key});

  @override
  State<BackgroundVideoAtom> createState() => _BackgroundVideoAtomState();
}

class _BackgroundVideoAtomState extends State<BackgroundVideoAtom> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/turtles.mp4',
    );
    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> init() async {
    await _controller.initialize();
    setState(() {});
    await _controller.setVolume(0);
    await _controller.play();
    await _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
          ),
          height: _controller.value.size.height,
          width: _controller.value.size.width,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}

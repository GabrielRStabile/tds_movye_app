import 'package:flutter/material.dart';

class MovieRatingAndReleaseDateAtom extends StatelessWidget {
  const MovieRatingAndReleaseDateAtom({
    required this.voteAverage,
    required this.releaseDate,
    super.key,
  });

  final double voteAverage;
  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow, size: 16),
        const SizedBox(width: 4),
        Text(
          voteAverage.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 16),
        const Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          releaseDate.year.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

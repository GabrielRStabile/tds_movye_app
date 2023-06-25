import 'package:dependencies/dependencies.dart';
import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';

import 'package:home/app/ui/pages/movie_details_page/atoms/movie_rating_and_release_date_atom.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 2,
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(movie.coverImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF0C0F15).withOpacity(0.9),
                const Color(0xFF0C0F15).withOpacity(0.5),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 8),
              MovieRatingAndReleaseDateAtom(
                voteAverage: movie.voteAverage,
                releaseDate: movie.releaseDate,
              ),
              const SizedBox(height: 16),
              Text(
                movie.description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              ButtonAtom.primary(
                label: 'Assistir',
                onPressed: () {
                  context.pushReplacement(
                    '/watch/${movie.id}?movieName=${movie.title}',
                  );
                },
                icon: Icons.play_circle,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            height: 8,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

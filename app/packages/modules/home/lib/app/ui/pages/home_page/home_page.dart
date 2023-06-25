import 'dart:ui';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/app/main/builders/for_you_recomendation_atom_builder.dart';
import 'package:home/app/main/builders/popular_movies_carousel_molecule_builder.dart';
import 'package:home/app/main/builders/upcomming_movies_carousel_molecule_builder.dart';
import 'package:home/app/ui/pages/home_page/atoms/section_title_atom.dart';
import 'package:identity/app/ui/shared/background_video_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  const BackgroundVideoAtom(),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://marcas-logos.net/wp-content/uploads/2020/03/NINJA-TURTLES-LOGO.png',
                      width: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.withOpacity(0.2),
                          ),
                          label: const Icon(Icons.play_arrow_rounded),
                          icon: const Text('Assistir agora'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 32),
                SectionTitleAtom(
                  boldPart: 'Chegando',
                  normalPart: ' agora',
                ),
                SizedBox(height: 12),
                UpcommingMoviesCarouselMoleculeBuilder(),
                SizedBox(height: 32),
                SectionTitleAtom(
                  boldPart: 'Especialmente',
                  normalPart: ' para você',
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: ForYouRecomendationAtomBuilder(),
                ),
                SizedBox(height: 32),
                SectionTitleAtom(
                  boldPart: 'Todos estão',
                  normalPart: ' assistindo',
                ),
                SizedBox(height: 12),
                PopularMoviesCarouselMoleculeBuilder(),
                SizedBox(height: 138),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:identity/app/ui/shared/background_video_atom.dart';

typedef IdentityScafoldPageBuilder = List<Widget> Function(
  BuildContext context,
  PageController controller,
);

class IdentityScafoldOrganism extends StatefulWidget {
  const IdentityScafoldOrganism({required this.builder, super.key});

  final IdentityScafoldPageBuilder builder;

  @override
  State<IdentityScafoldOrganism> createState() =>
      _IdentityScafoldOrganismState();
}

class _IdentityScafoldOrganismState extends State<IdentityScafoldOrganism> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              const BackgroundVideoAtom(),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 60,
                    sigmaY: 60,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.ease,
                    height: 450,
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(35, 35, 35, 0.1),
                          Color.fromRGBO(35, 35, 35, 0.90),
                        ],
                        stops: [0, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: widget.builder(context, pageController),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

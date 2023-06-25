import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class MovyeLogoAtom extends StatelessWidget {
  const MovyeLogoAtom({
    super.key,
    this.height = 40,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/movye-logo.svg',
      height: height,
    );
  }
}

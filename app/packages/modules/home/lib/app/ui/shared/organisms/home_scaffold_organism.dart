import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:home/app/ui/shared/organisms/app_bottom_bar_organism.dart';

class HomeScaffoldOrganism extends StatelessWidget {
  const HomeScaffoldOrganism({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const AppBottomBarOrganism(),
        body: child,
      ),
    );
  }
}

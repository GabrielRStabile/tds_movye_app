import 'dart:ui';

import 'package:core/app/micro_core_utils.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:home/app/ui/shared/atoms/bottom_bar_active_icon_atom.dart';
import 'package:identity/app/services/protocols/iauthentication_store.dart';

class AppBottomBarOrganism extends StatefulWidget {
  const AppBottomBarOrganism({super.key});

  @override
  State<AppBottomBarOrganism> createState() => _AppBottomBarOrganismState();
}

class _AppBottomBarOrganismState extends State<AppBottomBarOrganism> {
  final authenticationStore = autoInjector.get<IAuthenticationStore>();

  int _currentIndex = 0;

  static const tabs = [
    AppBottomBarItem(
      routeName: '/home',
      icon: Icon(Icons.home_outlined),
      activeIcon: BottomBarActiveIconAtom(
        icon: Icon(Icons.home_rounded),
      ),
      label: 'Início',
    ),
    AppBottomBarItem(
      routeName: '/search',
      icon: Icon(Icons.search_rounded),
      activeIcon: BottomBarActiveIconAtom(
        icon: Icon(Icons.search_rounded),
      ),
      label: 'Buscar',
    ),
    AppBottomBarItem(
      routeName: 'leave',
      icon: Icon(
        Icons.sensor_door_outlined,
        color: Colors.red,
      ),
      label: 'Sair',
      activeIcon: BottomBarActiveIconAtom(
        icon: Icon(Icons.sensor_door),
      ),
    ),
  ];

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;

    if (index == 3) {
      authenticationStore.signOut();
      return;
    }

    final router = GoRouter.of(context);
    final location = tabs[index].routeName;

    setState(() {
      _currentIndex = index;
    });

    router.go(location);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              _goOtherTab(context, index);
            },
            currentIndex: _currentIndex,
            items: tabs,
          ),
        ),
      ),
    );
  }
}

class AppBottomBarItem extends BottomNavigationBarItem {
  const AppBottomBarItem({
    required this.routeName,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(activeIcon: activeIcon ?? icon);
  final String routeName;
}

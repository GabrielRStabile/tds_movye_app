import 'package:flutter/material.dart';

class BottomBarActiveIconAtom extends StatelessWidget {
  const BottomBarActiveIconAtom({
    required this.icon,
    super.key,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF806BFF),
      ),
      child: icon,
    );
  }
}

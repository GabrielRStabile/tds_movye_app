import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.backgroundColor,
    this.enableDrag = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.isScrollControlled = false,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Offset? anchorPoint;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool useSafeArea;
  final WidgetBuilder builder;
  final bool isScrollControlled;
  final bool enableDrag;
  final Color? backgroundColor;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        builder: builder,
        anchorPoint: anchorPoint,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor,
        modalBarrierColor: barrierColor,
      );
}

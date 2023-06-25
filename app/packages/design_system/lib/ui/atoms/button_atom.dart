import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@protected
enum ButtonAtomType { primary, secondary, tertiary }

class ButtonAtom extends StatelessWidget {
  const ButtonAtom.primary({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  })  : _type = ButtonAtomType.primary,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const ButtonAtom.secondary({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  })  : _type = ButtonAtomType.secondary,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const ButtonAtom.tertiary({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  })  : _type = ButtonAtomType.tertiary,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final ButtonAtomType _type;

  @override
  Widget build(BuildContext context) {
    final rowChildren = <Widget>[];

    if (isLoading) {
      rowChildren.add(const CupertinoActivityIndicator());
    } else {
      if (icon != null) {
        rowChildren.add(
          Icon(
            icon,
            size: 24,
          ),
        );
      }

      if (icon != null && label != null) {
        rowChildren.add(
          const SizedBox(width: 10),
        );
      }

      if (label != null) {
        rowChildren.add(
          Text(
            label!,
            textAlign: TextAlign.center,
          ),
        );
      }
    }

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );

    final onPressed = isDisabled ? null : this.onPressed;

    switch (_type) {
      case ButtonAtomType.primary:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: const Color(0xFF806BFF).withOpacity(0.9),
            elevation: 10,
            minimumSize: const Size(double.infinity, 55),
            textStyle: Theme.of(context).textTheme.bodyMedium,
            foregroundColor: const Color(0xffffffff),
            side: const BorderSide(
              color: Color(0xFFDDDDDD),
              width: 0.8,
            ),
          ),
          child: child,
        );
      case ButtonAtomType.secondary:
      case ButtonAtomType.tertiary:
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: _type == ButtonAtomType.primary
                    ? const Color(0xFF171717).withOpacity(0.9)
                    : Colors.transparent,
                elevation: 10,
                minimumSize: const Size(double.infinity, 55),
                textStyle: Theme.of(context).textTheme.bodyMedium,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: child,
            ),
          ),
        );
    }
  }
}

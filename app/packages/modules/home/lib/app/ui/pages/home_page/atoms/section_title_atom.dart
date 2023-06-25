import 'package:flutter/material.dart';

class SectionTitleAtom extends StatelessWidget {
  const SectionTitleAtom({
    this.boldPart,
    this.normalPart,
    super.key,
  });

  final String? boldPart;
  final String? normalPart;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: boldPart,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: normalPart,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

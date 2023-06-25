import 'package:core/app/micro_core_utils.dart';
import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:design_system/ui/atoms/movye_logo_atom.dart';
import 'package:flutter/material.dart';

import 'package:identity/app/services/protocols/iauthentication_store.dart';

class WelcomeBodyOrganism extends StatefulWidget {
  const WelcomeBodyOrganism({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  State<WelcomeBodyOrganism> createState() => _WelcomeBodyOrganismState();
}

class _WelcomeBodyOrganismState extends State<WelcomeBodyOrganism> {
  final authenticationStore = autoInjector<IAuthenticationStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        const MovyeLogoAtom(),
        const Spacer(),
        Text(
          'Assista seus filmes e séries em um só lugar. Na hora que quiser e em qualquer lugar que você estiver.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(flex: 3),
        ButtonAtom.primary(
          label: 'Vamos lá',
          onPressed: widget.onTap,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}

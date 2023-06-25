import 'dart:async';

import 'package:core/app/micro_core_utils.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:flutter/material.dart';
import 'package:identity/app/services/protocols/iauthentication_store.dart';

class AuthenticationCodeBodyOrganism extends StatefulWidget {
  const AuthenticationCodeBodyOrganism({
    required this.goToPreviusPage,
    super.key,
  });

  final VoidCallback goToPreviusPage;

  @override
  State<AuthenticationCodeBodyOrganism> createState() =>
      _AuthenticationCodeBodyOrganismState();
}

class _AuthenticationCodeBodyOrganismState
    extends State<AuthenticationCodeBodyOrganism> {
  final authenticationStore = autoInjector<IAuthenticationStore>();
  final pinputController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      authenticationStore.sendAuthenticationCode(authenticationStore.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        Text(
          'Bem vindo!',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Caso tenha alguma conta vinculado ao email informado, enviaremos o código para entrar',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(flex: 3),
        Pinput(
          autofocus: true,
          controller: pinputController,
          length: 6,
          defaultPinTheme: PinTheme(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              border: Border.all(
                color: const Color(0xFFDDDDDD).withOpacity(0.3),
              ),
            ),
          ),
        ),
        const Spacer(flex: 2),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => authenticationStore
                .sendAuthenticationCode(authenticationStore.email),
            child: Text(
              'Não recebeu seu código? Reenvie!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const Spacer(flex: 2),
        ButtonAtom.primary(
          label: 'Confirmar',
          onPressed: () async {
            if (pinputController.text.length != 6) {
              return;
            }

            setState(() {
              isLoading = true;
            });

            await authenticationStore
                .signInWithAuthenticationCode(pinputController.text);

            setState(() {
              isLoading = false;
            });

            if (mounted) {
              context.go('/home');
            }
          },
          isLoading: isLoading,
        ),
        const Spacer(),
        ButtonAtom.secondary(
          label: 'Voltar',
          onPressed: widget.goToPreviusPage,
        ),
        const Spacer(),
      ],
    );
  }
}

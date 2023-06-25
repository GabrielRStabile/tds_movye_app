import 'package:core/app/micro_core_utils.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:flutter/material.dart';
import 'package:identity/app/services/protocols/iauthentication_store.dart';

class LoginBodyOrganism extends StatefulWidget {
  const LoginBodyOrganism({
    required this.goToRegisterPage,
    required this.goToAuthenticationCodePage,
    super.key,
  });

  final VoidCallback goToRegisterPage;
  final VoidCallback goToAuthenticationCodePage;

  @override
  State<LoginBodyOrganism> createState() => _LoginBodyOrganismState();
}

class _LoginBodyOrganismState extends State<LoginBodyOrganism> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final authenticationStore = autoInjector<IAuthenticationStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
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
          'Entre para continuar assistindo',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(flex: 3),
        Form(
          key: _formKey,
          child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: ValidationBuilder(localeName: 'pt-br')
                .email()
                .maxLength(50)
                .minLength(5)
                .build(),
          ),
        ),
        const Spacer(flex: 3),
        ButtonAtom.primary(
          label: 'Entrar',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              authenticationStore.email = emailController.text;

              widget.goToAuthenticationCodePage();
            }
          },
        ),
        const Spacer(flex: 2),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              widget.goToRegisterPage();
              _formKey.currentState?.reset();
            },
            child: Text(
              'Não tem uma conta? Crie!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

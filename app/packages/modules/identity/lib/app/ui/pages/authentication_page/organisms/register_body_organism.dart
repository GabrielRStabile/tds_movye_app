import 'package:core/app/micro_core_utils.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/ui/atoms/button_atom.dart';
import 'package:flutter/material.dart';

import 'package:identity/app/services/protocols/iauthentication_store.dart';

class RegisterBodyOrganism extends StatefulWidget {
  const RegisterBodyOrganism({
    required this.goToPreviusPage,
    required this.goToAuthenticationCodePage,
    super.key,
  });

  final VoidCallback goToPreviusPage;
  final VoidCallback goToAuthenticationCodePage;

  @override
  State<RegisterBodyOrganism> createState() => _RegisterBodyOrganismState();
}

class _RegisterBodyOrganismState extends State<RegisterBodyOrganism> {
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final authenticationStore = autoInjector<IAuthenticationStore>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
            'Crie uma conta e comece a assitir',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(flex: 3),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Nome completo',
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: ValidationBuilder(localeName: 'pt-br')
                .maxLength(50)
                .minLength(5)
                .build(),
          ),
          const Spacer(),
          TextFormField(
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
          const Spacer(),
          ExcludeFocus(
            child: TextFormField(
              controller: birthDateController,
              decoration: const InputDecoration(
                hintText: 'Data de nascimento',
                prefixIcon: Icon(Icons.calendar_month_outlined),
              ),
              validator: ValidationBuilder().required().build(),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());

                showDatePicker(
                  context: context,
                  locale: const Locale('pt', 'BR'),
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365 * 150)),
                  lastDate: DateTime.now(),
                ).then(
                  (selectedDate) {
                    if (selectedDate != null) {
                      birthDateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  },
                );
              },
            ),
          ),
          const Spacer(flex: 3),
          ButtonAtom.primary(
            label: 'Criar Conta',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                authenticationStore.registerWithEmail(
                  emailController.text,
                  DateFormat('dd/mm/yyyy').parse(birthDateController.text),
                  nameController.text,
                );
                widget.goToAuthenticationCodePage();
              }
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

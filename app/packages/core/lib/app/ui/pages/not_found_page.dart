import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Oops. Não encontramos essa página, que tal voltar para o início?',
            ),
            TextButton(
              onPressed: context.pop,
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

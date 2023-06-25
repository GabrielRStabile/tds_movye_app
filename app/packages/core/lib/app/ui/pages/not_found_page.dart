import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

/// A page widget displayed when a route is not found.
///
/// The [NotFoundPage] is a [StatelessWidget] that represents a page displayed
/// when a route is not found in the application. It provides a message and a
/// button to navigate back to the previous page or the home page.
class NotFoundPage extends StatefulWidget {
  /// Constructs a [NotFoundPage].
  ///
  /// The [key] parameter is an optional [Key] that can be used to identify
  /// this widget instance.
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Oops. Não encontramos essa página!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: context.pop,
                  child: const Text('Sair do Movye'),
                ),
                const SizedBox(width: 16),
                FilledButton.tonal(
                  onPressed:
                      context.canPop() ? context.pop : () => context.go('/'),
                  child: const Text('Ir para o início'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

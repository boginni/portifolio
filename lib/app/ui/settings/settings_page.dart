import 'package:flutter/material.dart';

import '../app/extensions/context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SelectableText(context.l10n.settings),
      ),
    );
  }
}

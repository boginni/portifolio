

import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';

class DevelopmentWarningDialog extends StatelessWidget {
  const DevelopmentWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.l10n.under_development,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.l10n.this_portfolio_is_currently_under_development,
          ),
          Text(
            context.l10n.please_check_back_later,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) => const DevelopmentWarningDialog(),
                  );
                }
              },
            );
          },
          child: const Text('Not ok'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
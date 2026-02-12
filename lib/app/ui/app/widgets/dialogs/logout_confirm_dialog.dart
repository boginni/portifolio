import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return LogoutConfirmDialog(
              onConfirm: () {
                Navigator.of(context).pop(true);
              },
              onCancel: () {
                Navigator.of(context).pop(false);
              },
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.logout),
      content: Text(context.l10n.are_you_sure_you_want_to_logout),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(context.l10n.leave),
        ),
      ],
    );
  }
}

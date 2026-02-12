import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';

class DeleteAccountConfirmDialog extends StatelessWidget {
  const DeleteAccountConfirmDialog({
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
            return DeleteAccountConfirmDialog(
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
      title: Text(context.l10n.delete_account_ask),
      content: Text(
        context.l10n.are_you_sure_you_want_to_delete_your_account,
      ),
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

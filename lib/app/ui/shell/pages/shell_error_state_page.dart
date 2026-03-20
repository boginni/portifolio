import 'package:flutter/material.dart';

class ShellPageErrorState extends StatelessWidget {
  const ShellPageErrorState({
    super.key,
    this.onRetry,
    this.onLogout,
  });

  final VoidCallback? onRetry;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16 * 2,
          children: [
            // const Icon(
            //   IconsaxPlusBold.warning_2,
            //   size: 16 * 8,
            // ),
            // Column(
            //   spacing: 8,
            //   children: [
            //     SelectableText(
            //       context.l10n.anUnexpectedErrorOccurred,
            //       style: context.dsTopology.h6,
            //       textAlign: TextAlign.center,
            //     ),
            //     SelectableText(
            //       context.l10n.pleaseTryAgainLaterOrContactSupport,
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),
            // Column(
            //   children: [
            //     FilledButton(
            //       onPressed: onRetry,
            //       child: SelectableText(context.l10n.tryAgain),
            //     ),
            //     TextButton(
            //       onPressed: onLogout,
            //       child: SelectableText(context.l10n.logout),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

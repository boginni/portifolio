import 'package:flutter/material.dart';

class AlthergoMainLoadingComponent extends StatelessWidget {
  const AlthergoMainLoadingComponent({
    super.key,
    this.onError,
    required this.isLoading,
  });

  final bool isLoading;
  final WidgetBuilder? onError;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16 * 2),
          ),
        ),
        Positioned(
          bottom: 16 * 5,
          left: 16,
          right: 16,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Althergo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 16 * 6,
                  child: Visibility(
                    visible: isLoading,
                    replacement: onError?.call(context) ?? const Offstage(),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class LocaleButtonWidget extends StatelessWidget {
  const LocaleButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return OutlinedButton(
        onPressed: onTap,
        child: Text(
          label,
        ),
      );
    }

    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
      ),
    );
  }
}

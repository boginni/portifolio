import 'package:flutter/material.dart';

class CareerOverviewComponent extends StatelessWidget {
  const CareerOverviewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              color: colorScheme.primary,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              'Overview',
              style: theme.textTheme.titleLarge?.copyWith(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Specializing in building scalable, high-performance cross-platform applications. '
          'I bridge the gap between complex app architecture and pixel-perfect UI, '
          'with a deep focus on SOLID principles and automated testing to ensure long-term maintainability.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(value: '7+', label: 'Years Exp.'),
            _StatItem(value: '2M+', label: 'Users Impacted'),
            _StatItem(value: '97%', label: 'Error-free'),
            _StatItem(value: '50+', label: 'Projects'),
          ],
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.secondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

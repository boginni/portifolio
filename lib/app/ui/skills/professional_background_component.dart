import 'package:flutter/material.dart';

import '../app/extensions/context_extensions.dart';

class ProfessionalBackgroundComponent extends StatelessWidget {
  const ProfessionalBackgroundComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Professional",
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Background Skills and\nAccomplishments",
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
                style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ToolCircle(Colors.orange),
            _ToolCircle(Colors.blueAccent),
            _ToolCircle(Colors.purpleAccent),
            _ToolCircle(Colors.greenAccent),
          ],
        ),
        const SizedBox(height: 48),
        _SkillGrid(),
      ],
    );
  }
}

class _SkillGrid extends StatelessWidget {
  const _SkillGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _SkillSlider("UI Design", 0.9),
              SizedBox(height: 24),
              _SkillSlider("Product Design", 0.8),
              SizedBox(height: 24),
              _SkillSlider("User Research", 0.85),
            ],
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          child: Column(
            children: [
              _SkillSlider("Coding", 0.6),
              SizedBox(height: 24),
              _NoCodeSlider(),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillSlider extends StatelessWidget {
  const _SkillSlider(this.label, this.value);

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              "${(value * 100).toInt()}%",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: value,
          backgroundColor: colorScheme.outline,
          color: colorScheme.primary,
          minHeight: 4,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}

class _NoCodeSlider extends StatelessWidget {
  const _NoCodeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          _SkillSlider("No Code Tools", 0.65),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.flash_on, size: 20),
              Icon(Icons.web, size: 20),
              Icon(Icons.shopping_bag, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolCircle extends StatelessWidget {
  const _ToolCircle(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: Center(
        child: Icon(Icons.auto_awesome, color: color, size: 40),
      ),
    );
  }
}

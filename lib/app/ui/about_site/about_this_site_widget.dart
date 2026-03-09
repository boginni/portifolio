import 'package:flutter/material.dart';

import '../app/extensions/context_extensions.dart';

class AboutThisSiteWidget extends StatelessWidget {
  const AboutThisSiteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'About This Project',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'This portfolio serves as a live technical demonstration of enterprise-grade Flutter development. '
          'Instead of a static build, it operates as a dynamic system with real-world infrastructure.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16 * 3),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 16 * 2,
          crossAxisSpacing: 16 * 2,
          childAspectRatio: 2.5,
          children: const [
            _FeatureTile(
              icon: Icons.sync_rounded,
              title: 'Dynamic Data',
              desc: 'Experience data fetched via GitHub API.',
            ),
            _FeatureTile(
              icon: Icons.rocket_launch_rounded,
              title: 'CI/CD Pipeline',
              desc: 'Automated builds via GitHub Actions.',
            ),
            _FeatureTile(
              icon: Icons.devices_rounded,
              title: 'Responsive Architecture',
              desc: 'Reactive layout for 5 breakpoints.',
            ),
            _FeatureTile(
              icon: Icons.translate_rounded,
              title: 'Localization',
              desc: 'Full i18n support & translations.',
            ),
            _FeatureTile(
              icon: Icons.analytics_rounded,
              title: 'Monitoring',
              desc: 'Firebase Crashlytics & Event tracking.',
            ),
            _FeatureTile(
              icon: Icons.shield_rounded,
              title: 'Security',
              desc: 'Cloudflare edge protection.',
            ),
          ],
        ),
        const SizedBox(height: 32),
        Center(
          child: OutlinedButton.icon(
            onPressed: () {

            },
            icon: const Icon(Icons.code_rounded),
            label: const Text('VIEW SOURCE CODE'),
          ),
        ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorScheme.primary,
            size: 16 * 5,
          ),
          const SizedBox(width: 16 * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                desc,
                style: context.textTheme.bodyMedium?.copyWith(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

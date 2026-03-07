import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_contact_entity.dart';

class ContactPageSuccessStatePhone extends StatelessWidget {
  const ContactPageSuccessStatePhone({
    super.key,
    required this.entity,
  });

  final ResumeContactEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  height: 16 * 22,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  DsAssetsPhotos.professionalFullSuitSeriousPng,
                  alignment: const Alignment(0, -0.8),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        colorScheme.surface.withValues(alpha: 0.1),
                        colorScheme.surface,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.name,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: colorScheme.surfaceContainerHighest,
                        ),
                      ),
                      Text(
                        entity.profession,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get in Touch',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        'Direct channels',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    children: [
                      _contactCard(
                        context,
                        icon: Icons.email_outlined,
                        title: 'Email',
                        value: entity.email,
                        onTap: () {},
                      ),
                      _contactCard(
                        context,
                        icon: Icons.phone_android_outlined,
                        title: 'WhatsApp',
                        value: entity.whatsapp,
                        onTap: () {},
                      ),
                      _contactCard(
                        context,
                        icon: Icons.location_on_outlined,
                        title: 'Location',
                        value: entity.location,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _socialIconButton(Icons.facebook, colorScheme),
                      _socialIconButton(Icons.camera_alt_outlined, colorScheme),
                      _socialIconButton(Icons.link, colorScheme),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _socialIconButton(IconData icon, ColorScheme colorScheme) {
    return IconButton.filledTonal(
      onPressed: () {},
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _contactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? value,
    bool isSocial = false,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      // Use surfaceContainerLow for a subtle M3 look
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Row(
            children: [
              // Icon container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colorScheme.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (isSocial)
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            // Add your social icons here
                            Icon(Icons.terminal, size: 18),
                            // GitHub placeholder
                            SizedBox(width: 12),
                            Icon(Icons.business_center, size: 18),
                            // LinkedIn placeholder
                          ],
                        ),
                      )
                    else
                      Text(
                        value ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

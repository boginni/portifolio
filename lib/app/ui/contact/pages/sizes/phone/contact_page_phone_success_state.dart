import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_contact_entity.dart';
import '../../../components/contact_card_widget.dart';

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
                      ContactCardWidget(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        value: entity.email,
                        onTap: () {},
                      ),
                      ContactCardWidget(
                        icon: Icons.phone_android_outlined,
                        title: 'WhatsApp',
                        value: entity.whatsapp,
                        onTap: () {},
                      ),
                      ContactCardWidget(
                        icon: Icons.location_on_outlined,
                        title: 'Location',
                        value: entity.location,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     _socialIconButton(Icons.facebook, colorScheme),
                  //     _socialIconButton(Icons.camera_alt_outlined, colorScheme),
                  //     _socialIconButton(Icons.link, colorScheme),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

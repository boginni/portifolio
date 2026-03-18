import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_contact_entity.dart';
import '../../../components/contact_card_widget.dart';

class ContactPageDesktopSuccessState extends StatelessWidget {
  const ContactPageDesktopSuccessState({
    super.key,
    required this.entity,
  });

  final ResumeContactEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get in Touch',
              style: theme.textTheme.titleMedium,
            ),
            const Spacer(),
            const Icon(
              Icons.person,
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: ,
            // ),
            // Text(
            //   'Direct channels',
            //   // style: theme.textTheme.bodyMedium?.copyWith(
            //   //   color: colorScheme.onSurfaceVariant,
            //   // ),
            // ),
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
        // const SizedBox(height: 16 * 2),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     _socialIconButton(Icons.facebook, colorScheme),
        //     _socialIconButton(Icons.camera_alt_outlined, colorScheme),
        //     _socialIconButton(Icons.link, colorScheme),
        //   ],
        // ),
      ],
    );
  }
}

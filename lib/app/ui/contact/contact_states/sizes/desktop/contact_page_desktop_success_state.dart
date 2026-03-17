import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_contact_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/components/high_resolution_image.dart';
import '../../../components/contact_card_widget.dart';

class ContactPageSuccessStateDesktop extends StatelessWidget {
  const ContactPageSuccessStateDesktop({
    super.key,
    required this.entity,
  });

  final ResumeContactEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16 * 2,
        horizontal: 16 * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Get in Touch',
                style: theme.textTheme.headlineSmall,
              ),
              const Spacer(),
              const CloseButton(),
            ],
          ),
          const SizedBox(height: 16 * 2),
          Flexible(
            child: Row(
              spacing: 16 * 3,
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    shape: LinearBorder.bottom(
                      side: BorderSide(
                        color: context.colorScheme.outline,
                      ),
                    ),
                    child: Material(
                      color: context.colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      child: Transform.scale(
                        scale: 1.5,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          DsAssetsPhotos.purpleTCrossedArmsPng,
                          fit: BoxFit.cover,
                          alignment: const Alignment(0, -.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../../app/extensions/context_extensions.dart';
import '../../contact/contact_controller.dart';
import '../../contact/contact_page.dart';

class SideBarComponent extends StatelessWidget {
  const SideBarComponent({
    super.key,
    required this.contactController,
  });

  final ContactController contactController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16 * 22,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16 * 2,
        ),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              clipBehavior: Clip.antiAlias,
              child: Material(
                color: context.colorScheme.primaryContainer,
                shape: const CircleBorder(),
                child: Transform.scale(
                  scale: 1.5,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    DsAssetsPhotos.purpleTCrossedArmsPng,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const _NavLink('About me'),
            const _NavLink('Skills'),
            const _NavLink('Portfolio'),
            const Spacer(),
            ContactPage(
              controller: contactController,
              forceDisplaySize: ResponsiveDisplaySizeEnum.wide,
            ),
            const SizedBox(
              height: 16 * 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        label,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

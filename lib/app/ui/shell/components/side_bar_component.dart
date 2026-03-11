import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../app/components/rainbow_theme_builder.dart';
import '../../app/components/responsive_builder.dart';
import '../../app/extensions/context_extensions.dart';
import '../../app/store/generic_store.dart';
import '../../contact/contact_controller.dart';
import '../../contact/contact_page.dart';
import '../../pdf/pdf_controller.dart';
import '../../pdf/components/pdf_download_component.dart';

class SideBarComponent extends StatelessWidget {
  const SideBarComponent({
    super.key,
    required this.contactController,
    required this.pdfController,
  });

  final ContactController contactController;
  final PdfController pdfController;

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
                  ),
                ),
              ),
            ),

            const _NavLink('About me'),
            const _NavLink('Skills'),
            const _NavLink('The project'),
            const Divider(),
            const _NavLink('Languages'),
            const _NavLink('Brightness mode'),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: PdfDownloadComponent(
                pdfController,
              ),
            ),
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

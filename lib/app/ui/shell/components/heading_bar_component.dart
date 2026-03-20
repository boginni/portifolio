import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';
import '../../pdf/components/pdf_download_component.dart';
import '../../pdf/pdf_controller.dart';
import '../controller/shell_controller.dart';
import 'locale_button_widget.dart';

class HeadingBarComponent extends StatelessWidget {
  const HeadingBarComponent({
    super.key,
    required this.onContactMe,
    required this.onAboutMe,
    required this.onSkills,
    required this.shellController,
    required this.pdfController,
  });

  final ShellController shellController;
  final PdfController pdfController;

  final VoidCallback onContactMe;
  final VoidCallback onAboutMe;
  final VoidCallback onSkills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16 * 2,
        vertical: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            DsAssetsIcons.bfPng,
            height: 16 * 2,
            color: context.colorScheme.primary,
          ),
          const Spacer(),
           _NavItemWidget(
            context.l10n.about_me,
          ),
           _NavItemWidget(
            context.l10n.skills,
          ),
          _NavItemWidget(context.l10n.portfolio),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onContactMe,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.surface,
              foregroundColor: context.colorScheme.onSurface,
              shape: const StadiumBorder(),
            ),
            child: Text(context.l10n.contact_me),
          ),
          const SizedBox(width: 8),
          PdfDownloadComponent(
            pdfController,
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              final newMode =
                  context.isDarkMode ? ThemeMode.light : ThemeMode.dark;

              shellController.setThemeMode(
                newMode,
              );
            },
            icon: Icon(
              context.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
          const SizedBox(width: 16),
          LocaleButtonWidget(
            label: 'EN',
            isSelected:
                shellController.appController.store.locale?.languageCode ==
                'en',
            onTap: () {
              shellController.setLocale(const Locale('en'));
            },
          ),
          const SizedBox(
            width: 4,
          ),
          LocaleButtonWidget(
            label: 'PT',
            isSelected:
                shellController.appController.store.locale?.languageCode ==
                'pt',
            onTap: () {
              shellController.setLocale(const Locale('pt'));
            },
          ),
        ],
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SelectableText(
        label,
        style: context.textTheme.labelLarge,
      ),
    );
  }
}

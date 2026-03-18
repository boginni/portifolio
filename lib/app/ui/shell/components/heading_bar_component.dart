import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/controllers/app_controller.dart';
import '../../app/extensions/context_extensions.dart';
import '../../pdf/components/pdf_download_component.dart';
import '../../pdf/pdf_controller.dart';
import 'locale_button_widget.dart';

class HeadingBarComponent extends StatelessWidget {
  const HeadingBarComponent({
    super.key,
    required this.onContactMe,
    required this.onAboutMe,
    required this.onSkills,
    required this.appController,
    required this.pdfController,
  });

  final AppController appController;
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
          const _NavItemWidget(
            'About me',
          ),
          const _NavItemWidget(
            'Skills',
          ),
          const _NavItemWidget('Portfolio'),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onContactMe,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.surface,
              foregroundColor: context.colorScheme.onSurface,
              shape: const StadiumBorder(),
            ),
            child: const Text('CONTACT ME'),
          ),
          const SizedBox(width: 8),
          PdfDownloadComponent(
            pdfController,
          ),
          const SizedBox(width: 16),
          IconButton(
            isSelected: appController.store.value.themeMode == ThemeMode.dark,
            onPressed: () {
              appController.setThemeMode(ThemeMode.dark);
            },
            icon: const Icon(Icons.dark_mode),
          ),
          IconButton(
            isSelected: appController.store.value.themeMode == ThemeMode.light,
            onPressed: () {
              appController.setThemeMode(ThemeMode.light);
            },
            icon: const Icon(Icons.light_mode),
          ),
          const SizedBox(width: 8),
          LocaleButtonWidget(
            label: 'EN',
            isSelected: appController.store.value.locale?.languageCode == 'en',
            onTap: () {
              appController.setLocale(const Locale('en'));
            },
          ),
          const SizedBox(
            width: 4,
          ),
          LocaleButtonWidget(
            label: 'PT',
            isSelected: appController.store.value.locale?.languageCode == 'pt',
            onTap: () {
              appController.setLocale(const Locale('pt'));
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
      child: Text(
        label,
        style: context.textTheme.labelLarge,
      ),
    );
  }
}

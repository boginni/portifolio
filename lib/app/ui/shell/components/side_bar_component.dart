// ignore_for_file: unused_element

import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../../app/controllers/app_controller.dart';
import '../../app/extensions/context_extensions.dart';
import '../../contact/contact_controller.dart';
import '../../contact/contact_page.dart';
import '../../pdf/pdf_controller.dart';
import '../../pdf/components/pdf_download_component.dart';
import '../../app/components/profile_avatar_widget.dart';
import 'locale_button_widget.dart';

class SideBarComponent extends StatelessWidget {
  const SideBarComponent({
    super.key,
    required this.appController,
    required this.contactController,
    required this.pdfController,
  });

  final AppController appController;
  final ContactController contactController;
  final PdfController pdfController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
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
              const ProfileAvatarWidget(),
              const _NavLink('About me'),
              const _NavLink('Skills'),
              const _NavLink('The project'),
              SizedBox(
                width: double.infinity,
                child: PdfDownloadComponent(
                  pdfController,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  const Text('Brightness'),
                  const Spacer(),
                  IconButton(
                    isSelected:
                        appController.store.value.themeMode == ThemeMode.dark,
                    onPressed: () {
                      appController.setThemeMode(ThemeMode.dark);
                    },
                    icon: const Icon(Icons.dark_mode),
                  ),
                  IconButton(
                    isSelected:
                        appController.store.value.themeMode == ThemeMode.light,
                    onPressed: () {
                      appController.setThemeMode(ThemeMode.light);
                    },
                    icon: const Icon(Icons.light_mode),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Language'),
                  const Spacer(),
                  LocaleButtonWidget(
                    label: 'EN',
                    isSelected:
                        appController.store.value.locale?.languageCode == 'en',
                    onTap: () {
                      appController.setLocale(const Locale('en'));
                    },
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  LocaleButtonWidget(
                    label: 'PT',
                    isSelected:
                        appController.store.value.locale?.languageCode == 'pt',
                    onTap: () {
                      appController.setLocale(const Locale('pt'));
                    },
                  ),
                ],
              ),
              const Divider(),
              ContactPage(
                controller: contactController,
                forceDisplaySize: ResponsiveDisplaySizeEnum.wide,
              ),
              const SizedBox(
                height: 16 * 2,
              ),
              Center(
                child: Image.asset(
                  DsAssetsIcons.bfPng,
                  color: context.colorScheme.primary,
                  height: 16 * 4,
                  width: 16 * 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(this.label);

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

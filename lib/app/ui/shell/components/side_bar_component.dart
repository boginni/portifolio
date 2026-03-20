import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../../app/extensions/context_extensions.dart';
import '../../contact/contact_controller.dart';
import '../../contact/contact_page.dart';
import '../../pdf/pdf_controller.dart';
import '../../pdf/components/pdf_download_component.dart';
import '../../app/components/profile_avatar_widget.dart';
import '../controller/shell_controller.dart';
import 'locale_button_widget.dart';

class SideBarComponent extends StatelessWidget {
  const SideBarComponent({
    super.key,
    required this.shellController,
    required this.contactController,
    required this.pdfController,
  });

  final ShellController shellController;
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
              _NavLink(
                context.l10n.about_me,
              ),
              _NavLink(
                context.l10n.skills,
              ),
              _NavLink(
                context.l10n.portfolio,
              ),
              SizedBox(
                width: double.infinity,
                child: PdfDownloadComponent(
                  pdfController,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  SelectableText(context.l10n.brightness),
                  const Spacer(),
                  IconButton(
                    isSelected: context.isDarkMode == true,
                    onPressed: () {
                      shellController.setThemeMode(ThemeMode.dark);
                    },
                    icon: const Icon(Icons.dark_mode),
                  ),
                  IconButton(
                    isSelected: context.isDarkMode == false,
                    onPressed: () {
                      shellController.setThemeMode(ThemeMode.light);
                    },
                    icon: const Icon(Icons.light_mode),
                  ),
                ],
              ),
              Row(
                children: [
                  SelectableText(context.l10n.language),
                  const Spacer(),
                  LocaleButtonWidget(
                    label: 'EN',
                    isSelected:
                        shellController
                            .appController
                            .store
                            .locale
                            ?.languageCode ==
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
                        shellController
                            .appController
                            .store
                            .locale
                            ?.languageCode ==
                        'pt',
                    onTap: () {
                      shellController.setLocale(const Locale('pt'));
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
      child: SelectableText(
        label,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

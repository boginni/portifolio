import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../../app/controllers/app_controller.dart';
import '../../app/extensions/context_extensions.dart';
import '../../contact/contact_controller.dart';
import '../../contact/contact_page.dart';
import '../../pdf/pdf_controller.dart';
import '../../pdf/components/pdf_download_component.dart';

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
              SizedBox(
                width: double.infinity,
                child: PdfDownloadComponent(
                  pdfController,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Text('Brightness'),
                  Spacer(),
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
                  Text('Language'),
                  Spacer(),
                  _LocaleButton(
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
                  _LocaleButton(
                    label: 'PT',
                    isSelected:
                        appController.store.value.locale?.languageCode == 'pt',
                    onTap: () {
                      appController.setLocale(const Locale('pt'));
                    },
                  ),

                  // TextButton(
                  //   onPressed: () {
                  //     appController.setLocale(const Locale('en'));
                  //   },
                  //   child: Text('EN'),
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     appController.setLocale(const Locale('pt'));
                  //   },
                  //   child: Text('PT'),
                  // ),
                ],
              ),
              const Divider(),
              ContactPage(
                controller: contactController,
                forceDisplaySize: ResponsiveDisplaySizeEnum.wide,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocaleButton extends StatelessWidget {
  const _LocaleButton({
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return OutlinedButton(
        onPressed: onTap,
        child: Text(
          label,
        ),
      );
    }

    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
      ),
    );
  }
}

class _SelectionTile extends StatelessWidget {
  const _SelectionTile(
    this.label, {
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
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

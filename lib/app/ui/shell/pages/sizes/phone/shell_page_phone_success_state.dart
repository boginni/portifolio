import 'package:flutter/material.dart';

import '../../../../about_site/pages/about_site_page.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../contact/contact_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../pdf/components/pdf_download_component.dart';
import '../../../../skills/pages/skills_page.dart';
import '../../../components/locale_button_widget.dart';
import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';

class ShellPagePhoneSuccessState extends StatelessWidget {
  const ShellPagePhoneSuccessState({
    super.key,
    required this.controller,
  });

  final ShellController controller;

  ShellStore get store => controller.store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: PdfDownloadComponent(controller.pdfController),
        actions: [
          IconButton(
            onPressed: () {
              final newMode =
                  context.isDarkMode ? ThemeMode.light : ThemeMode.dark;

              controller.appController.setThemeMode(
                newMode,
              );
            },
            icon: Icon(
              context.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
          const SizedBox(width: 8),
          LocaleButtonWidget(
            label: 'EN',
            isSelected:
                controller.appController.store.value.locale?.languageCode ==
                'en',
            onTap: () {
              controller.appController.setLocale(const Locale('en'));
            },
          ),
          const SizedBox(
            width: 4,
          ),
          LocaleButtonWidget(
            label: 'PT',
            isSelected:
                controller.appController.store.value.locale?.languageCode ==
                'pt',
            onTap: () {
              controller.appController.setLocale(const Locale('pt'));
            },
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
      body: PageView(
        controller: store.pageController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          HomePage(
            controller: controller.homeController,
          ),
          ExperiencePage(
            controller: controller.experienceController,
          ),
          ContactPage(
            controller: controller.contactController,
          ),
          SkillsPage(
            controller: controller.skillsController,
          ),
          AboutSitePage(
            controller: controller.aboutSiteController,
          ),
        ],
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: store.pageController,
        builder: (context, child) {
          return NavigationBar(
            selectedIndex: store.pageSelected,
            onDestinationSelected: (value) {
              store.pageController.jumpToPage(value);
            },
            destinations: const [
              NavigationDestination(
                label: 'home',
                icon: Icon(
                  Icons.home,
                ),
                selectedIcon: Icon(
                  Icons.home_filled,
                ),
              ),
              NavigationDestination(
                label: 'experience',
                icon: Icon(
                  Icons.work_outline,
                ),
                selectedIcon: Icon(
                  Icons.work,
                ),
              ),
              NavigationDestination(
                label: 'contact',
                icon: Icon(
                  Icons.contact_mail_outlined,
                ),
                selectedIcon: Icon(
                  Icons.contact_mail,
                ),
              ),
              NavigationDestination(
                label: 'Skills',
                icon: Icon(
                  Icons.code_outlined,
                ),
                selectedIcon: Icon(
                  Icons.code,
                ),
              ),
              NavigationDestination(
                label: 'Project',
                icon: Icon(
                  Icons.info_outline,
                ),
                selectedIcon: Icon(
                  Icons.info,
                ),
              ),
              // NavigationDestination(
              //   label: 'settings',
              //   icon: Icon(
              //     Icons.settings_outlined,
              //   ),
              //   selectedIcon: Icon(
              //     Icons.settings,
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}

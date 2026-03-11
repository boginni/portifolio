import 'package:flutter/material.dart';

import '../../../../about_site/about_site_page.dart';
import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../../app/components/responsive_builder.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../events/events_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/skills_page.dart';
import '../../../components/side_bar_component.dart';
import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';

class ShellPageSuccessStateUltraWide extends StatelessWidget {
  const ShellPageSuccessStateUltraWide({
    super.key,
    required this.controller,
  });

  final ShellController controller;

  ShellStore get store => controller.store;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SideBarComponent(
              contactController: controller.contactController,
              pdfController: controller.pdfController,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(14),
                    1: FlexColumnWidth(10),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Material(
                            color: context.colorScheme.inverseSurface,
                            child: Column(
                              children: [
                                HomePage(
                                  controller: controller.homeController,
                                ),
                                Column(
                                  children: [
                                    InverseBrightnessBuilder(
                                      builder: (context, theme) {
                                        return SkillsPage(
                                          controller:
                                              controller.skillsController,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16 * 4),
                                Image.network(
                                  context.isDarkMode
                                      ? 'https://wakatime.com/share/@boginni/377bf0cc-80c8-4263-b9a2-2e06c5535e36.png'
                                      : 'https://wakatime.com/share/@boginni/f9e946db-3a4f-4866-a680-4c74e7e26833.png',
                                ),
                                const EventsPage(),
                                const SizedBox(height: 16 * 4),
                                Expanded(
                                  child: InverseBrightnessBuilder(
                                    builder: (context, theme) {
                                      return AboutSitePage(
                                        controller:
                                        controller.aboutSiteController,
                                      );
                                    },
                                  ),
                                ),
                                // const Spacer(),
                                // Divider(
                                //   color: context.colorScheme.outlineVariant,
                                // ),
                                // const SizedBox(height: 32),
                                // Padding(
                                //   padding: const EdgeInsets.all(16.0),
                                //   child: InverseBrightnessBuilder(
                                //     builder: (context, themeData) {
                                //       return const AppFooter();
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Material(
                            color: context.colorScheme.surface,
                            child: ExperiencePage(
                              forcedDisplaySize:
                                  ResponsiveDisplaySizeEnum.ultraWide,
                              controller: controller.experienceController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

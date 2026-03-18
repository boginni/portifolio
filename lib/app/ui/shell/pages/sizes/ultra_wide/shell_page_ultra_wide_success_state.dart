import 'package:flutter/material.dart';

import '../../../../about_site/pages/about_site_page.dart';
import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../../app/components/responsive_builder.dart';
import '../../../../app/components/waka_time_grid_widget.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../events/events_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/pages/skills_page.dart';
import '../../../components/side_bar_component.dart';
import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';

class ShellPageUltraWideSuccessState extends StatelessWidget {
  const ShellPageUltraWideSuccessState({
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
              appController: controller.appController,
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
                                const WakaTimeGridWidget(),
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

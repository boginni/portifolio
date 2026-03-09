import 'package:flutter/material.dart';

import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../../app/components/responsive_builder.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../events/events_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../footer/footer_component.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/professional_background_component.dart';
import '../../../components/side_bar_component.dart';
import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';
import '../../../../about_site/about_this_site_widget.dart';

class ShellPageSuccessStateUltraWide extends StatelessWidget {
  const ShellPageSuccessStateUltraWide({
    super.key,
    required this.controller,
  });

  final ShellController controller;

  ShellStore get store => controller.store;

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView(
    //   child: Table(
    //     // This sets your 10:13 (Column B is 30% wider) ratio
    //     columnWidths: const {
    //       0: FlexColumnWidth(10),
    //       1: FlexColumnWidth(13),
    //     },
    //     children: [
    //       TableRow(
    //         children: [
    //           // COLUMN A
    //           TableCell(
    //             verticalAlignment: TableCellVerticalAlignment.fill, // <--- THE MAGIC
    //             child: Column(
    //               children: [
    //                 const Text("Top Content A"),
    //                 GridView.count(
    //                   shrinkWrap: true,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   crossAxisCount: 2, // Example grid
    //                   children: [Text("Grid Item")],
    //                 ),
    //                 const Spacer(), // <--- THIS WILL NOW WORK
    //                 const Padding(
    //                   padding: EdgeInsets.all(8.0),
    //                   child: Text("© Disclaimer"),
    //                 ),
    //               ],
    //             ),
    //           ),
    //
    //           // COLUMN B (The Tall One)
    //           TableCell(
    //             child: Column(
    //               children: List.generate(50, (i) =>
    //                   Text("Content in B that makes it tall $i")
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // )

    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SideBarComponent(
              contactController: controller.contactController,
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
                                        return const ProfessionalBackgroundComponent();
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16 * 4,
                                  ),
                                  child: InverseBrightnessBuilder(
                                    builder: (context, theme) {
                                      return const AboutThisSiteWidget();
                                    },
                                  ),
                                ),
                                Spacer(),
                                Divider(
                                  color: context.colorScheme.outlineVariant,
                                ),
                                const SizedBox(height: 32),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: InverseBrightnessBuilder(
                                    builder: (context, themeData) {
                                      return AppFooter();
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

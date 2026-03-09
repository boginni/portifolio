import 'package:flutter/material.dart';

import '../../../../app/components/responsive_builder.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/professional_background_component.dart';
import '../../../components/side_bar_component.dart';
import '../../../controller/shell_controller.dart';

class ShellPageWide extends StatelessWidget {
  const ShellPageWide({super.key, required this.controller});

  final ShellController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideBarComponent(
              contactController: controller.contactController,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomePage(
                      controller: controller.homeController,
                    ),
                    ExperiencePage(
                      forcedDisplaySize: ResponsiveDisplaySizeEnum.wide,
                      controller: controller.experienceController,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16 * 2,
                        vertical: 16 * 3,
                      ),
                      child: ProfessionalBackgroundComponent(),
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

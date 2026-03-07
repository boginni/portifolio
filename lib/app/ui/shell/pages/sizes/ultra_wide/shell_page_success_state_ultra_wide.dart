import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../app/components/responsive_builder.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../contact/contact_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideBarComponent(
              contactController: controller.contactController,
            ),
            Expanded(
              child: Material(
                color: context.colorScheme.inverseSurface,
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: HomePage(
                          controller: controller.homeController,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ExperiencePage(
                          forcedDisplaySize: ResponsiveDisplaySizeEnum.ultraWide,
                          controller: controller.experienceController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../about_site/pages/about_site_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/pages/skills_page.dart';
import '../../../components/side_bar_component.dart';
import '../../../controller/shell_controller.dart';

class ShellPageWideSuccessState extends StatelessWidget {
  const ShellPageWideSuccessState({
    super.key,
    required this.controller,
  });

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
              pdfController: controller.pdfController,
              shellController: controller,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomePage(
                      controller: controller.homeController,
                    ),
                    ExperiencePage(
                      controller: controller.experienceController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16 * 2,
                        vertical: 16 * 3,
                      ),
                      child: SkillsPage(
                        controller: controller.skillsController,
                      ),
                    ),
                    AboutSitePage(
                      controller: controller.aboutSiteController,
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

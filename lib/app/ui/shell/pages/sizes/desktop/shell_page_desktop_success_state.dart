// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../../../../about_site/pages/about_site_page.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../contact/contact_page.dart';
import '../../../../events/events_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/pages/skills_page.dart';
import '../../../components/heading_bar_component.dart';
import '../../../controller/shell_controller.dart';

class ShellPageDesktopSuccessState extends StatelessWidget {
  const ShellPageDesktopSuccessState({super.key, required this.controller});

  final ShellController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: HeadingBarComponent(
                onContactMe: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: ContactPage(
                          controller: controller.contactController,
                        ),
                      );
                    },
                  );
                },
                onAboutMe: () {},
                onSkills: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: HomePage(controller: controller.homeController),
            ),
            SliverToBoxAdapter(
              child: ExperiencePage(
                controller: controller.experienceController,
              ),
            ),
            SliverToBoxAdapter(
              child: SkillsPage(
                controller: controller.skillsController,
              ),
            ),
            SliverToBoxAdapter(
              child: AboutSitePage(
                controller: controller.aboutSiteController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

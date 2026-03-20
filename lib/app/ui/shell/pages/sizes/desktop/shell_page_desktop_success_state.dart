import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../about_site/pages/about_site_page.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../../contact/contact_page.dart';
import '../../../../experience/experience_page.dart';
import '../../../../home/pages/home_page.dart';
import '../../../../skills/pages/skills_page.dart';
import '../../../components/heading_bar_component.dart';
import '../../../controller/shell_controller.dart';

class ShellPageDesktopSuccessState extends StatefulWidget {
  const ShellPageDesktopSuccessState({super.key, required this.controller});

  final ShellController controller;

  @override
  State<ShellPageDesktopSuccessState> createState() =>
      _ShellPageDesktopSuccessStateState();
}

class _ShellPageDesktopSuccessStateState
    extends State<ShellPageDesktopSuccessState> {
  bool isShowingContactDialog = false;

  @override
  void deactivate() {
    super.deactivate();
    if (isShowingContactDialog) {
      context.pop();
    }
  }

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
                shellController: widget.controller,
                pdfController: widget.controller.pdfController,
                onContactMe: () async {
                  isShowingContactDialog = true;

                  await showDialog(
                    context: context,
                    builder: (context) {
                      return ContactPage(
                        controller: widget.controller.contactController,
                      );
                    },
                  );

                  isShowingContactDialog = false;
                },
                onAboutMe: () {},
                onSkills: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: HomePage(controller: widget.controller.homeController),
            ),
            SliverToBoxAdapter(
              child: ExperiencePage(
                controller: widget.controller.experienceController,
              ),
            ),
            SliverToBoxAdapter(
              child: SkillsPage(
                controller: widget.controller.skillsController,
              ),
            ),
            SliverToBoxAdapter(
              child: AboutSitePage(
                controller: widget.controller.aboutSiteController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

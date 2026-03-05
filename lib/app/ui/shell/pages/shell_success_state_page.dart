import 'package:flutter/material.dart';

import '../../contact/contact_page.dart';
import '../../experience/experience_page.dart';
import '../../home/home_page.dart';
import '../controller/shell_controller.dart';
import '../controller/shell_store.dart';

class ShellSuccessStatePage extends StatefulWidget {
  const ShellSuccessStatePage({
    required this.controller,
    super.key,
  });

  final ShellController controller;

  @override
  State<ShellSuccessStatePage> createState() => _ShellSuccessStatePageState();
}

class _ShellSuccessStatePageState extends State<ShellSuccessStatePage> {
  ShellController get controller => widget.controller;

  ShellStore get store => controller.store;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PageView(
        controller: store.pageController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          HomePage(
            controller: controller.homeController,
          ),
          ExperiencePage(controller: controller.experienceController),
          ContactPage(controller: controller.contactController),
          // const SettingsPage(),
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

import 'package:flutter/material.dart';
import '../../app/components/responsive_builder.dart';
import '../home_controller.dart';
import 'sizes/desktop/home_page_desktop.dart';
import 'sizes/phone/home_page_phone.dart';
import '../home_store.dart';
import 'sizes/tablet/home_page_tablet.dart';
import 'sizes/ultra_wide/home_page_ultra_wide.dart';
import 'sizes/wide/home_page_wide.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  HomeController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (controller.store.value is HomeStoreInitialState) {
          init();
        }
      },
    );
  }

  Future<void> init() async {
    await controller.loadResume();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone:
          (context) => HomePagePhone(
            onRefresh: init,
            controller: controller,
          ),
      tablet:
          (context) => HomePageTablet(
            onRefresh: init,
            controller: controller,
          ),
      desktop:
          (context) => HomePageDesktop(
            onRefresh: init,
            controller: controller,
          ),
      wide:
          (context) => HomePageWide(
            onRefresh: init,
            controller: controller,
          ),
      ultraWide:
          (context) => HomePageUltraWide(
            onRefresh: init,
            controller: controller,
          ),
    );
  }
}

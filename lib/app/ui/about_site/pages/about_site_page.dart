import 'package:flutter/material.dart';
import '../../app/components/responsive_builder.dart';
import '../../app/mixin/change_language_listener_mixin.dart';
import '../../app/store/generic_store.dart';
import '../about_site_controller.dart';
import 'sizes/desktop/about_site_page_desktop.dart';
import 'sizes/ultra_wide/about_site_page_ultra_wide.dart';

class AboutSitePage extends StatefulWidget {
  const AboutSitePage({
    super.key,
    required this.controller,
    this.forcedDisplaySize,
  });

  final AboutSiteController controller;
  final ResponsiveDisplaySizeEnum? forcedDisplaySize;

  @override
  State<AboutSitePage> createState() => _AboutSitePAgeState();
}

class _AboutSitePAgeState extends State<AboutSitePage>
    with ChangeLanguageListenerMixin {
  AboutSiteController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (controller.store.value is GenericStoreInitialState) {
          init();
        }
      },
    );
  }

  Future<void> init() async {
    await controller.load();
  }

  @override
  void onLanguageChanged(Locale newLocale) {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone:
          (context) => AboutSitePageUltraWide(
            controller: controller,
            init: init,
          ),
      desktop:
          (context) => AboutSitePageDesktop(
            controller: controller,
            init: init,
          ),
      wide:
          (context) => AboutSitePageUltraWide(
            controller: controller,
            init: init,
          ),
      ultraWide:
          (context) => AboutSitePageUltraWide(
            controller: controller,
            init: init,
          ),
    );
  }
}

import 'package:flutter/material.dart';

import '../app/components/responsive_builder.dart';
import 'controllers/skills_controller.dart';
import 'pages/sizes/skills_page_ultra_wide.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({
    required this.controller,
    super.key,
  });

  final SkillsController controller;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  SkillsController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        init();
      },
    );
  }

  Future<void> init() async {
    await controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      ultraWide:
          (context) => SkillsPageUltraWide(
            controller: controller,
            init: init,
          ),
      phone:
          (context) => SkillsPageUltraWide(
            controller: controller,
            init: init,
          ),
    );
  }
}

import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

class WakaTimeGridWidget extends StatelessWidget {
  const WakaTimeGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      context.isDarkMode
          ? 'https://wakatime.com/share/@boginni/377bf0cc-80c8-4263-b9a2-2e06c5535e36.png'
          : 'https://wakatime.com/share/@boginni/f9e946db-3a4f-4866-a680-4c74e7e26833.png',
    );
  }
}

import 'package:flutter/material.dart';
import '../../../gen/app_localizations.g.dart';
import 'controllers/app_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    super.key,
    required this.controller,
  });

  final AppController controller;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        init();
      },
    );
  }

  void init() {
    // widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller.store,
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Brunno França',
          locale: const Locale('pt', 'BR'),
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: ThemeMode.system,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: widget.controller.appRoutes.routes,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../gen/app_localizations.g.dart';
import 'app_dependencies.dart';
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
    AppDependencies.registerSingleton(widget.controller);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        init();
      },
    );
  }

  void init() {
    // widget.controller.init();
  }

  late final lightTheme = getTheme(
    ThemeData.light(useMaterial3: true),
  );

  late final darkTheme = getTheme(
    ThemeData.dark(useMaterial3: true),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.store,
      builder: (context, value, child) {
        return MaterialApp.router(
          title: 'Brunno França',
          locale: value.locale,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value.themeMode,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: widget.controller.appRoutes.routes,
        );
      },
    );
  }

  ThemeData getTheme(ThemeData base) {
    return base.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
    );
  }
}

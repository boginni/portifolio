import 'dart:async';

import 'package:flutter/material.dart';

import '../app_dependencies.dart';
import '../controllers/app_store.dart';

mixin ChangeLanguageListenerMixin<T extends StatefulWidget> on State<T> {
  void onLanguageChanged(Locale newLocale);

  late StreamSubscription changeLanguageSubscription;

  void listenLanguageChanges() {
    final appStore = AppDependencies.get<AppStore>();
    changeLanguageSubscription = appStore.changeLanguageNotifier.listen(
      onLanguageChanged,
    );
  }

  @override
  void initState() {
    super.initState();
    listenLanguageChanges();
  }

  @override
  void dispose() {
    super.dispose();
    changeLanguageSubscription.cancel();
  }
}

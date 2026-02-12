import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'home_states/home_failure_state_page.dart';
import 'home_states/home_loading_state_page.dart';
import 'home_states/home_success_state_page.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});

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
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, HomeStoreState value, child) => switch (value) {
            HomeStoreInitialState() => const HomeLoadingStatePage(),
            HomeStoreSuccessState() => HomeSuccessStatePage(
              value,
              onRefresh: init,
            ),
            HomeStoreLoadingState() => const HomeLoadingStatePage(),
            HomeStoreFailureState() => const HomeFailureStatePage(),
          },
    );
  }
}

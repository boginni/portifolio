import 'dart:async';

import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';

import '../app/extensions/context_extensions.dart';
import '../shell/shell_routes.dart';
import 'splash_controller.dart';
import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    required this.controller,
    super.key,
  });

  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController get controller => widget.controller;

  SplashStore get store => controller.store;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        initialize();
      },
    );
  }

  Future<void> initialize() async {
    store.state = SplashStoreLoadingState();
    await navigate();
  }

  Future<void> navigate() async {
    context.goToRoute(ShellRoute());
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: SafeArea(
            child: switch (store.state) {
              SplashStoreLoadingState() => Stack(
                children: [],
              ),
              SplashStorePermissionFailureState() => Stack(
                children: [
                  Positioned(
                    bottom: 80,
                    left: 16,
                    right: 16,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: initialize,
                            child: Text('x'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SplashStoreFailToGetLocationState() => Stack(
                children: [
                  Positioned(
                    bottom: 80,
                    left: 16,
                    right: 16,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: initialize,
                            child: Text('x'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SplashStorePermissionDeniedForeverState() => Stack(
                children: [
                  Positioned(
                    bottom: 80,
                    left: 16,
                    right: 16,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Permissão negada permanentemente.',
                            style: context.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Por favor, habilite as permissões nas configurações',
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: initialize,
                            child: Text('x'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            },
          ),
        );
      },
    );
  }
}

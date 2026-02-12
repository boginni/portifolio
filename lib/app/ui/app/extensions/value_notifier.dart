import 'package:flutter/foundation.dart';

extension ValueNotifierExtension<T> on T {
  ValueNotifier<T> get notifier => ValueNotifier<T>(this);

  ValueNotifier<T?> get notifierNullable => ValueNotifier<T?>(this);
}

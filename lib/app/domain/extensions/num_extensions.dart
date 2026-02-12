import 'dart:math' as math;

import 'package:intl/intl.dart';

final _formatCurrency = NumberFormat.currency(
  locale: 'fr_FR',
  symbol: '€',
  decimalDigits: 2,
);

extension NumExtension on num {
  num toRadians() {
    return this * (math.pi / 180.0);
  }

  num roundToFixed(int fractionDigits) {
    final pow = math.pow(10, fractionDigits);

    return (this * pow).round() / pow;
  }

  String formatCurrencyEuro() {
    return _formatCurrency.format(this);
  }
}

extension IntExtension on int {
  double toRadians() {
    return this * (math.pi / 180.0);
  }

  double roundToFixed(int fractionDigits) {
    final pow = math.pow(10, fractionDigits);

    return (this * pow).round() / pow;
  }

  Duration get durationInMilliseconds => Duration(milliseconds: this);

  Duration get durationInSeconds => Duration(seconds: this);

  Duration get durationInMinutes => Duration(minutes: this);

  Duration get durationInHours => Duration(hours: this);

  Duration get durationInDays => Duration(days: this);
}

extension DoubleExtension on double {
  double toRadians() {
    return this * (math.pi / 180.0);
  }

  String formatCurrencyEuro() {
    return _formatCurrency.format(this);
  }
}

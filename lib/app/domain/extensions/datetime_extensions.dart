extension DateTimeExtension on DateTime {
  int get semester => month < 7 ? 1 : 2;
}

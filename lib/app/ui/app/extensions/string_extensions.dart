extension StringExtensions on String {
  List<String> slipParagraphs() {
    return split(
      '\n\n',
    ).map((e) => e.trim()).where((element) => element.isNotEmpty).toList();
  }
}

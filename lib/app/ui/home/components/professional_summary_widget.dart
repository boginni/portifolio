import 'package:flutter/material.dart';

import '../../app/extensions/string_extensions.dart';

class ProfessionalSummaryWidget extends StatelessWidget {
  const ProfessionalSummaryWidget(
    this.data, {
    super.key,
    this.textStyle,
  });

  final String data;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          data
              .slipParagraphs()
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    e,
                    style: textStyle,
                  ),
                ),
              )
              .toList(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/utils/currency_format.dart';

class MoneyText extends StatelessWidget {
  const MoneyText(
    this.amount, {
    super.key,
    this.style,
  });

  final int amount;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatRupiah(amount),
      style: style?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
          ) ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
    );
  }
}

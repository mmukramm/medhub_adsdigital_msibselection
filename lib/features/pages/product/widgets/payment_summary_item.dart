import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';

class PaymentSummaryItem extends StatelessWidget {
  final String text;
  final double price;
  const PaymentSummaryItem({
    super.key,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium!.copyWith(color: highlightColor),
          ),
        ),
        Text(
          formatRupiah(price),
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}

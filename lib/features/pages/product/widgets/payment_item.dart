
import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/checkout_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/dot_indicator.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class PaymentItem extends StatelessWidget {
  final Payment payment;
  final bool isSelected;
  final VoidCallback onTap;
  const PaymentItem({
    super.key,
    required this.payment,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: highlightColor),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              width: 32,
              AssetHelper.getPayment(payment.paymentImg),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              payment.name,
              style: textTheme.titleMedium,
            ),
          ),
          const SizedBox(width: 8),
          DotIndicator(isSelected: isSelected),
        ],
      ),
    );
  }
}
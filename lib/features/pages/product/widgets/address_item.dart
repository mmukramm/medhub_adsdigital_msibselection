import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/checkout_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/dot_indicator.dart';

class AddressItem extends StatelessWidget {
  final Address address;
  final bool isSelected;
  final VoidCallback onTap;
  const AddressItem({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: highlightColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DotIndicator(isSelected: isSelected),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.addressName,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    address.phone,
                    style:
                        textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                  Text(
                    address.spesificAddress,
                    style:
                        textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgHelper(
                assetPath: AssetHelper.getIcon(
                  'pencil-bottom-line.svg',
                ),
                color: highlightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
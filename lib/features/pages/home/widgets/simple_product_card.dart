import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';

class SimpleProductCard extends StatelessWidget {
  final Product diabeticDiet;
  final VoidCallback onTap;

  const SimpleProductCard({
    super.key,
    required this.diabeticDiet,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: scaffoldColor,
          border: Border.all(
            color: highlightColor.withOpacity(.2),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: cardImgBackgroundColor,
              height: 120,
              child: Image.asset(
                width: double.infinity,
                fit: BoxFit.cover,
                AssetHelper.getImage(
                  diabeticDiet.images[0],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 12,
                    right: 20,
                    bottom: 12,
                  ),
                  child: Text(
                    diabeticDiet.name,
                    style: textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/home_page.dart';

class CategoryItem extends StatelessWidget {

  final TopCategory topCategory;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.topCategory,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  gradient: topCategory.gradient,
                  shape: BoxShape.circle),
              child: SvgHelper(
                assetPath: AssetHelper.getIcon(topCategory.icon),
              ),
            ),
            const SizedBox(height: 8),
            Text(topCategory.name),
          ],
        ),
      ),
    );
  }
}
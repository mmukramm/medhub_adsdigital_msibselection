import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/single_indicator.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';

class PageIndicator extends StatelessWidget {
  final int selectedPage;
  final int itemCount;

  const PageIndicator({
    super.key,
    required this.selectedPage,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) => SingleIndicator(color: getIndicatorColor(index)),
      ),
    );
  }

  Color getIndicatorColor(int index) {
    return selectedPage == index ? secondaryColor : highlightColor;
  }
}

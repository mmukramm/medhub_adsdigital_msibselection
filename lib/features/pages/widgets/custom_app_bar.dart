import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/cart_page.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool withActions;

  const CustomAppBar({
    super.key,
    this.title,
    this.withActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: scaffoldColor,
      title: title != null ? Text(title!, style: textTheme.titleLarge) : null,
      toolbarHeight: 72,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          navigatorKey.currentState!.pop();
        },
        icon: SvgHelper(
          assetPath: AssetHelper.getIcon('arrow-back.svg'),
          color: primaryColor,
        ),
      ),
      actions: withActions
          ? [
              IconButton(
                onPressed: () {
                  navigatorKey.currentState!.push(MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ));
                },
                icon: SvgHelper(
                  assetPath: AssetHelper.getIcon('cart.svg'),
                  color: primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgHelper(
                  assetPath: AssetHelper.getIcon('notification-on.svg'),
                ),
              ),
            ]
          : null,
    );
  }
}

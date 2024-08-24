import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/profile/profile_page.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.menu,
  });

  final ProfileMenu menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          SvgHelper(
            width: 32,
            assetPath: AssetHelper.getIcon(menu.icon),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              menu.title,
              style: textTheme.titleMedium,
            ),
          ),
          SvgHelper(
            width: 32,
            assetPath: AssetHelper.getIcon('caret.svg'),
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

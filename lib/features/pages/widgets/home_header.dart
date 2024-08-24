import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 224,
      decoration: const BoxDecoration(
        color: largeAppBarColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            buildBackground(),
            Positioned(
              top: 8,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: scaffoldColor,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      height: double.infinity,
                      AssetHelper.getImage('luis-villasmil-hh3ViD0r0Rc-unsplash.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgHelper(
                          assetPath: AssetHelper.getIcon(
                            'notification-on-white.svg',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgHelper(
                          assetPath: AssetHelper.getIcon(
                            'cart.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hi, Lorem',
                    style:
                        textTheme.displaySmall!.copyWith(color: scaffoldColor),
                  ),
                  Text(
                    'Welcome to MedHub',
                    style: textTheme.bodyLarge!.copyWith(color: scaffoldColor),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -28,
              left: 20,
              right: 20,
              child: Material(
                elevation: 8,
                shadowColor: primaryColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(40),
                child: FormBuilderTextField(
                  name: 'search',
                  autofocus: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Search Medicine & Healthcare products',
                    hintStyle: textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
                      child: SvgHelper(
                        assetPath: AssetHelper.getIcon('search.svg'),
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildBackground() {
    return Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -200,
                    bottom: -200,
                    child: Container(
                      width: 360,
                      height: 360,
                      decoration: BoxDecoration(
                        color: scaffoldColor.withOpacity(.12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
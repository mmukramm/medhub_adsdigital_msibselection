import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/on_boarding_page.dart';

import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: -50,
            right: -50,
            child: Image.asset(
              AssetHelper.getImage('splash-bg.png'),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgHelper(
                    assetPath: AssetHelper.getIcon('logo.svg'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: brandBackgroundColor,
                    ),
                    child: Text(
                      'Medhub',
                      style: textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        ),
      );
    });
  }
}

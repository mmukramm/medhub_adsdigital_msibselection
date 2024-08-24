import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/splash_page.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/theme.dart';

class MedHub extends StatelessWidget {
  const MedHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedHub',
      theme: theme,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
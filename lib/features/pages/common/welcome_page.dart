import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/login_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/register_page.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgHelper(
              assetPath: AssetHelper.getIllustration('mask-group.svg'),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to ', style: textTheme.titleLarge),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: brandBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'MedHub',
                    style: textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Do you want some help with your health to get better life?',
                    textAlign: TextAlign.center,
                    style:
                        textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text('SIGN UP WITH EMAIL'),
              ),
            ),
            const SizedBox(height: 8),
            buildOutlineButton(
              onClick: () {},
              icon: 'facebook.svg',
              text: 'CONTINUE WITH FACEBOOK',
            ),
            const SizedBox(height: 8),
            buildOutlineButton(
              onClick: () {},
              icon: 'google.svg',
              text: 'CONTINUE WITH GMAIL',
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: primaryTextColor,
                ),
                onPressed: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'LOGIN',
                  style: textTheme.bodyMedium!.copyWith(color: highlightColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOutlineButton({
    required VoidCallback onClick,
    required String icon,
    required String text,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: primaryTextColor,
          side: BorderSide(color: highlightColor.withOpacity(.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgHelper(
              assetPath: AssetHelper.getIcon(icon),
            ),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
      ),
    );
  }
}

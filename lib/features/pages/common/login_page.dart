import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/register_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/main_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_password_text_field.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_text_field.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Welcome Back!',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  name: 'username',
                  hintText: 'Username',
                  prefixIcon: SvgHelper(
                    assetPath: AssetHelper.getIcon('user-login.svg'),
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                CustomPasswordTextField(
                  name: 'password',
                  hintText: 'Password',
                  withForgot: true,
                  prefixIcon: SvgHelper(
                    assetPath: AssetHelper.getIcon('lock.svg'),
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState!.pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const MainPage(),
                        ),
                        (_) => false,
                      );
                    },
                    child: const Text('SIGN IN'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: InkWell(
                onTap: () {
                  navigatorKey.currentState!.push(MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: -45 * math.pi,
                      child: SvgHelper(
                        assetPath: AssetHelper.getIcon('caret.svg'),
                        color: highlightColor,
                      ),
                    ),
                    Text(
                      'Already have account?  Login',
                      style:
                          textTheme.bodyMedium!.copyWith(color: highlightColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

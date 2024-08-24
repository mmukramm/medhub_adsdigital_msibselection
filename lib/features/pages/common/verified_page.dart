import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class VerifiedPage extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onClickButton;

  const VerifiedPage({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onClickButton,
  });

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
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgHelper(
                    assetPath: AssetHelper.getIllustration('verified.svg'),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onClickButton,
                  child: Text(buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/welcome_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/page_indicator.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final List<PageItem> pages;
  late final ValueNotifier<int> pageIndex;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    pageIndex = ValueNotifier(0);

    pageController = PageController();

    pages = [
      const PageItem(
        illustration: 'buy-medicine.svg',
        title: 'View and buy \nMedicine online',
        description:
            'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
      ),
      const PageItem(
        illustration: 'medical-phone.svg',
        title: 'Online medical & \nHealthcare',
        description:
            'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, pageValue, __) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 80,
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    pageIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgHelper(
                          assetPath:
                              AssetHelper.getIllustration(page.illustration),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium!.copyWith(
                              color: highlightColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                left: 24,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: toWelcomePage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: highlightColor,
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Skip'),
                    ),
                    PageIndicator(
                      selectedPage: pageValue,
                      itemCount: pages.length,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (pageValue < pages.length - 1) {
                          pageIndex.value++;
                          pageController.animateToPage(
                            pageIndex.value,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        } else {
                          toWelcomePage();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: secondaryColor,
                          padding: EdgeInsets.zero),
                      child: Text(
                        pageValue < pages.length - 1 ? 'Next' : 'Start',
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void toWelcomePage() {
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (_) => const WelcomePage(),
      ),
    );
  }
}

class PageItem {
  final String illustration;
  final String title;
  final String description;

  const PageItem({
    required this.illustration,
    required this.title,
    required this.description,
  });
}

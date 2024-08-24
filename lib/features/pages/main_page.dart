import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/home_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/cart_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/profile/profile_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/notification/notification_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Widget> pages;
  late int selectedPage;

  @override
  void initState() {
    super.initState();
    selectedPage = 0;

    pages = [
      const HomePage(),
      const NotificationPage(),
      const SizedBox(),
      const CartPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: scaffoldColor,
        elevation: 8,
        onTap: (value) {
          if (value == 3) {
            navigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => const CartPage(),
            ));
          } else if (value == 2) {
            return;
          } else {
            setState(() {
              selectedPage = value;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgHelper(
              assetPath: AssetHelper.getIcon('home.svg'),
              color: selectedPage == 0 ? secondaryColor : highlightColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: selectedPage == 1
                ? SvgHelper(
                    assetPath: AssetHelper.getIcon('notification-off.svg'),
                    color: secondaryColor,
                  )
                : SvgHelper(
                    assetPath:
                        AssetHelper.getIcon('notification-on-highlight.svg'),
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgHelper(
                assetPath: AssetHelper.getIcon('plus-square.svg'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgHelper(
              assetPath: AssetHelper.getIcon('cart.svg'),
              color: highlightColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgHelper(
              assetPath: AssetHelper.getIcon('user.svg'),
              color: selectedPage == 4 ? secondaryColor : highlightColor,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/profile/widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final List<ProfileMenu> profileMenus;
  @override
  void initState() {
    super.initState();
    profileMenus = [
      ProfileMenu(
        icon: 'custom-note.svg',
        title: 'Private Account',
        onClick: () {},
      ),
      ProfileMenu(
        icon: 'custom-stethoscope.svg',
        title: 'My Consults',
        onClick: () {},
      ),
      ProfileMenu(
        icon: 'custom-document.svg',
        title: 'My orders',
        onClick: () {},
      ),
      ProfileMenu(
        icon: 'custom-clock.svg',
        title: 'Billing',
        onClick: () {},
      ),
      ProfileMenu(
        icon: 'custom-ask.svg',
        title: 'Faq',
        onClick: () {},
      ),
      ProfileMenu(
        icon: 'custom-setting.svg',
        title: 'Settings',
        onClick: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: textTheme.titleLarge!.copyWith(color: primaryTextColor),
        ),
        backgroundColor: scaffoldColor,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: scaffoldColor,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Image.asset(
                    AssetHelper.getImage('luis-villasmil-hh3ViD0r0Rc-unsplash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Lorem Ipsum',
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      'Welcome to MedHub',
                      style:
                          textTheme.bodyMedium!.copyWith(color: highlightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          ListView.separated(
            itemBuilder: (context, index) {
              final menu = profileMenus[index];
              return ProfileItem(menu: menu);
            },
            shrinkWrap: true,
            separatorBuilder: (_, __) => const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Divider(),
            ),
            itemCount: profileMenus.length,
          ),
        ],
      ),
    );
  }
}

class ProfileMenu {
  final String icon;
  final String title;
  final VoidCallback onClick;
  ProfileMenu({
    required this.icon,
    required this.title,
    required this.onClick,
  });
}

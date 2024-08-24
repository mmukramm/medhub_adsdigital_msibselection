import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';


ThemeData get theme {
  return ThemeData.from(
    colorScheme: colorScheme,
    textTheme: textTheme,
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: scaffoldColor,
    primaryColor: primaryColor,
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 4,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: scaffoldColor,
        padding: const EdgeInsets.all(14)
      ),
    )
  );
}

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: backgroundColor,
  primary: primaryColor,
  secondary: secondaryTextColor,
  onPrimary: scaffoldColor,
  onSecondary: scaffoldColor,
);

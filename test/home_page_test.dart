import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/home_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/home_header.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/page_indicator.dart';

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('HomePage renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.byType(HomeHeader), findsOneWidget);

      expect(find.byType(CarouselSlider), findsOneWidget);

      expect(find.text('Top Categories'), findsOneWidget);

      expect(find.text('Deals of The Day'), findsOneWidget);

      expect(find.text('Featured Brands'), findsOneWidget);
    });

    testWidgets('CarouselSlider works and updates page indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.byType(PageIndicator), findsOneWidget);

      await tester.drag(find.byType(CarouselSlider), const Offset(-300, 0));
      await tester.pumpAndSettle();

      expect(find.byType(PageIndicator), findsOneWidget);
    });
  

  });
}
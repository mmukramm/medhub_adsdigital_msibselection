import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/category_page.dart';

import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/widgets/category_item.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/product_detail.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/home_header.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/page_indicator.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<TopCategory> topCategories;
  late final List<FeaturedBrands> featuredBrands;
  late final List<String> carouselImages;
  late final List<Product> deals;
  late final ValueNotifier<int> carouselIndex;
  @override
  void initState() {
    super.initState();
    carouselIndex = ValueNotifier(0);

    deals = [
      Product(
          name: 'Accu-check Active Test Strip',
          price: 112000,
          rating: 4.2,
          images: [
            'accu.png',
            'accu.png',
            'accu.png',
          ],
          category: 'Etiam mollis metus non purus',
          shortCategory: 'Etiam mollis',
          productDetails:
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
          packageSize: [
            ProductPackageSize(price: 252000, pelletTotal: 500),
            ProductPackageSize(price: 100000, pelletTotal: 110),
            ProductPackageSize(price: 160000, pelletTotal: 300),
          ]),
      Product(
          name: 'Omron HEM-8712 BP Monitor',
          price: 150000,
          rating: 4.2,
          images: [
            'omron.png',
            'omron.png',
            'omron.png',
          ],
          category: 'Etiam mollis metus non purus',
          shortCategory: 'Etiam mollis',
          productDetails:
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
          packageSize: [
            ProductPackageSize(price: 252000, pelletTotal: 500),
            ProductPackageSize(price: 100000, pelletTotal: 110),
            ProductPackageSize(price: 160000, pelletTotal: 300),
          ]),
    ];

    carouselImages = [
      'carousel-img.png',
      'carousel-img.png',
      'carousel-img.png',
      'carousel-img.png',
    ];
    topCategories = [
      TopCategory(
          icon: 'dental.svg',
          name: 'Dental',
          gradient: GradientColors.pinkGradient),
      TopCategory(
          icon: 'wellness.svg',
          name: 'Wellness',
          gradient: GradientColors.greenGradient),
      TopCategory(
          icon: 'homeo.svg',
          name: 'Homeo',
          gradient: GradientColors.orangeGradient),
      TopCategory(
          icon: 'eye-care.svg',
          name: 'Eye Care',
          gradient: GradientColors.lightBlueGradient),
      TopCategory(
          icon: 'skin-hair.svg',
          name: 'Skin & Hair',
          gradient: GradientColors.darkBlueGradient),
    ];
    featuredBrands = [
      FeaturedBrands(image: 'himalaya.png', name: 'Himalaya Wellness'),
      FeaturedBrands(image: 'accu-chek.png', name: 'Accu-Chek'),
      FeaturedBrands(image: 'vlcc.png', name: 'Vlcc'),
      FeaturedBrands(image: 'protinex.png', name: 'Protinex'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const SizedBox(height: 52),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Top Categories',
                  style: textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final topCategory = topCategories[index];
                    return CategoryItem(
                      topCategory: topCategory,
                      onTap: () {
                        navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (_) => const CategoryPage(),
                          ),
                        );
                      },
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 32),
                  itemCount: topCategories.length,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Stack(
            children: [
              CarouselSlider(
                items: List.generate(
                  carouselImages.length,
                  (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AssetHelper.getImage(
                        carouselImages[index],
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 3 / 1,
                  enlargeCenterPage: true,
                  clipBehavior: Clip.antiAlias,
                  onPageChanged: (index, reason) {
                    carouselIndex.value = index;
                  },
                  autoPlay: true,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: ValueListenableBuilder(
                  valueListenable: carouselIndex,
                  builder: (_, value, __) {
                    return PageIndicator(
                      selectedPage: value,
                      itemCount: carouselImages.length,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deals of The Day',
                      style: textTheme.titleMedium,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'More',
                        style: textTheme.bodyLarge!
                            .copyWith(color: secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final product = deals[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (_) => ProductDetail(product: product),
                          ),
                        );
                      },
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 32),
                  itemCount: deals.length,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Featured Brands',
                  style: textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final brand = featuredBrands[index];
                    return SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: scaffoldColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Image.asset(
                              AssetHelper.getBrand(brand.image),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            brand.name,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemCount: featuredBrands.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopCategory {
  final String icon;
  final String name;
  final LinearGradient gradient;
  TopCategory({
    required this.icon,
    required this.name,
    required this.gradient,
  });
}

class FeaturedBrands {
  final String image;
  final String name;
  FeaturedBrands({
    required this.image,
    required this.name,
  });
}

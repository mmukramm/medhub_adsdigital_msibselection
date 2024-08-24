import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/product_detail.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/product_card.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';

import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/home/widgets/simple_product_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final List<Product> diabeticDiets;
  late final List<Product> allProducts;

  @override
  void initState() {
    super.initState();
    diabeticDiets = [
      Product(
        name: 'Sugar Substitute',
        price: 112000,
        rating: 4.2,
        images: [
          'sugar-substitute.png',
          'sugar-substitute.png',
          'sugar-substitute.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
      Product(
        name: 'Juices & Vinegars',
        price: 112000,
        rating: 4.2,
        images: [
          'juices-vinegars.png',
          'juices-vinegars.png',
          'juices-vinegars.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
      Product(
        name: 'Vitamins & Medicines',
        price: 112000,
        rating: 4.2,
        images: [
          'vitamins-medicines.png',
          'vitamins-medicines.png',
          'vitamins-medicines.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
    ];

    allProducts = [
      Product(
        name: 'Accu-check Active Test Strip',
        price: 112000,
        rating: 4.2,
        images: [
          'category1.png',
          'category1.png',
          'category1.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
      Product(
        name: 'Omron HEM-8712 BP Monitor',
        price: 150000,
        rating: 4.2,
        images: [
          'category2.png',
          'category2.png',
          'category2.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
      Product(
        name: 'Accu-check Active Test Strip',
        price: 112000,
        rating: 4.2,
        images: [
          'category3.png',
          'category3.png',
          'category3.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
      Product(
        name: 'Omron HEM-8712 BP Monitor',
        price: 150000,
        rating: 4.2,
        images: [
          'category4.png',
          'category4.png',
          'category4.png',
        ],
        category: 'Etiam mollis metus non purus',
        shortCategory: 'Etiam mollis',
        productDetails:
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        packageSize: [
          ProductPackageSize(price: 252000, pelletTotal: 500),
          ProductPackageSize(price: 100000, pelletTotal: 110),
          ProductPackageSize(price: 160000, pelletTotal: 300),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(
          title: 'Diabetes Care',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                width: double.infinity,
                AssetHelper.getImage('carousel-img.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Diabetic Diet',
                    style: textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final diabeticDiet = diabeticDiets[index];
                      return SimpleProductCard(
                        diabeticDiet: diabeticDiet,
                        onTap: () => toProductDetail(diabeticDiet),
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemCount: diabeticDiets.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'All Products',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 8,
                    childAspectRatio: 6 / 9,
                    mainAxisSpacing: 12,
                    children: List.generate(
                      allProducts.length,
                      (index) {
                        final product = allProducts[index];
                        return ProductCard(
                          onTap: () => toProductDetail(product),
                          product: product,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toProductDetail(Product product) {
    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => ProductDetail(product: product),
      ),
    );
  }
}

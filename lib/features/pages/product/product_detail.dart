import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/cart_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/page_indicator.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late final ValueNotifier<int> selectedImage;
  late final ValueNotifier<ProductPackageSize> selectedPackage;

  @override
  void initState() {
    super.initState();
    selectedImage = ValueNotifier(0);
    selectedPackage = ValueNotifier(widget.product.packageSize[0]);
  }

  @override
  void dispose() {
    super.dispose();
    selectedImage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(withActions: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.product.name,
                    style: textTheme.headlineSmall,
                  ),
                  Text(
                    widget.product.category,
                    style:
                        textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: widget.product.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: cardImgBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            AssetHelper.getImage(
                              widget.product.images[index],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          selectedImage.value = index;
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: ValueListenableBuilder(
                        valueListenable: selectedImage,
                        builder: (_, value, __) {
                          return PageIndicator(
                            selectedPage: value,
                            itemCount: widget.product.images.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatRupiah(widget.product.price),
                        style: textTheme.titleMedium,
                      ),
                      Text(
                        widget.product.shortCategory,
                        style: textTheme.bodyMedium!
                            .copyWith(color: highlightColor),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgHelper(
                          assetPath: AssetHelper.getIcon('plus-square.svg'),
                          color: secondaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add to Cart',
                          style: textTheme.bodyMedium!
                              .copyWith(color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Package Size',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  ValueListenableBuilder(
                    valueListenable: selectedPackage,
                    builder: (context, value, __) {
                      return Row(
                        children: List.generate(
                          widget.product.packageSize.length,
                          (index) {
                            final packageSize =
                                widget.product.packageSize[index];
                            if (packageSize == value) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: secondaryColor.withOpacity(.04),
                                      border: Border.all(color: secondaryColor),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          formatRupiah(packageSize.price),
                                        ),
                                        Text(
                                          '${packageSize.pelletTotal} pellets',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                onTap: () =>
                                    selectedPackage.value = packageSize,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: highlightColor.withOpacity(.2),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        formatRupiah(packageSize.price),
                                      ),
                                      Text(
                                        '${packageSize.pelletTotal} pellets',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Product Details',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.productDetails,
                    style: textTheme.bodyMedium!.copyWith(
                      color: highlightColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Rating & Reviews',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.product.rating}',
                                  style: textTheme.displayMedium,
                                ),
                                SvgHelper(
                                  assetPath: AssetHelper.getIcon('star.svg'),
                                  width: 40,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '923 Ratings and 257 Reviews',
                              style: textTheme.bodySmall!.copyWith(
                                color: highlightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 1,
                        height: 80,
                        color: highlightColor.withOpacity(.3),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            RatingIndicator(
                              star: 5,
                              percentage: .67,
                            ),
                            RatingIndicator(
                              star: 4,
                              percentage: .2,
                            ),
                            RatingIndicator(
                              star: 3,
                              percentage: .07,
                            ),
                            RatingIndicator(
                              star: 2,
                              percentage: .0,
                            ),
                            RatingIndicator(
                              star: 1,
                              percentage: .02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem Hoffman',
                            style: textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              SvgHelper(
                                assetPath: AssetHelper.getIcon('star.svg'),
                                color: Colors.yellow,
                              ),
                              Text(
                                '4.5',
                                style: textTheme.bodySmall!.copyWith(
                                  color: highlightColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        '05 August 2024',
                        style: textTheme.bodyMedium!
                            .copyWith(color: highlightColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas.',
                    style:
                        textTheme.bodyMedium!.copyWith(color: highlightColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState!.push(
                      MaterialPageRoute(
                        builder: (_) => const CartPage(),
                      ),
                    );
                  },
                  child: const Text('GO TO CART'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingIndicator extends StatelessWidget {
  final int star;
  final double percentage;
  const RatingIndicator({
    super.key,
    required this.star,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$star',
          style: textTheme.bodySmall!.copyWith(color: highlightColor),
        ),
        SvgHelper(
          assetPath: AssetHelper.getIcon('star.svg'),
          width: 20,
          color: Colors.yellow,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: highlightColor,
            value: percentage,
            valueColor: const AlwaysStoppedAnimation(
              secondaryColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 32,
          child: Text(
            '${(percentage * 100).toInt()}%',
            style: textTheme.bodySmall!.copyWith(color: highlightColor),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/checkout_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/cart_item.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/payment_summary_item.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final List<Product> products;

  @override
  void initState() {
    super.initState();
    products = [
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(
          title: 'Your Cart',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2 items in your cart',
                    style: textTheme.bodyMedium!.copyWith(
                      color: highlightColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgHelper(
                          assetPath: AssetHelper.getIcon('plus.svg'),
                          color: secondaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add more',
                          style: textTheme.bodyMedium!
                              .copyWith(color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                itemBuilder: (context, index) => CartItem(
                  product: products[index],
                ),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Divider(),
                ),
                itemCount: products.length,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: highlightColor.withOpacity(.4))),
                child: Row(
                  children: [
                    SvgHelper(
                      width: 32,
                      assetPath: AssetHelper.getIcon('discount.svg'),
                      color: primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '1 Discount applied',
                        style: textTheme.titleMedium!
                            .copyWith(color: secondaryColor),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgHelper(
                        width: 32,
                        assetPath: AssetHelper.getIcon('close-circle.svg'),
                        color: highlightColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Payment Summary', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  const PaymentSummaryItem(
                    text: 'Order Total',
                    price: 12300,
                  ),
                  const PaymentSummaryItem(
                    text: 'Items Discount',
                    price: 12300,
                  ),
                  const PaymentSummaryItem(
                    text: 'Coupon Discount',
                    price: 12300,
                  ),
                  const PaymentSummaryItem(
                    text: 'Shipping',
                    price: 12300,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: textTheme.bodyLarge,
                        ),
                      ),
                      Text(
                        formatRupiah(120893),
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState!.push(
                        MaterialPageRoute(builder: (_) => const CheckoutPage()),
                      );
                    },
                    child: Text('Place Order @ ${formatRupiah(1290182)}'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

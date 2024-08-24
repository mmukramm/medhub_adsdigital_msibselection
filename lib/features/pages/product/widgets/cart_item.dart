import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({
    super.key,
    required this.product,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late final ValueNotifier<int> amount;

  @override
  void initState() {
    super.initState();
    amount = ValueNotifier(1);
  }

  @override
  void dispose() {
    super.dispose();
    amount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            AssetHelper.getImage(widget.product.images.first),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.product.name,
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          '...',
                          style: textTheme.bodyMedium!
                              .copyWith(color: highlightColor),
                        ),
                      ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatRupiah(widget.product.price),
                    style: textTheme.titleMedium,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ValueListenableBuilder(
                        valueListenable: amount,
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (value > 1) {
                                    amount.value--;
                                  }
                                },
                                splashRadius: 0.0001,
                                padding: EdgeInsets.zero,
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: secondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgHelper(
                                    assetPath: AssetHelper.getIcon('minus.svg'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '$value',
                                  style: textTheme.titleMedium,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  amount.value++;
                                },
                                splashRadius: 0.0001,
                                padding: EdgeInsets.zero,
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgHelper(
                                    assetPath: AssetHelper.getIcon('plus.svg'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medhub_adsdigital_msibselection/features/models/product.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: scaffoldColor,
            border: Border.all(
              color: highlightColor.withOpacity(.2),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 140,
                color: cardImgBackgroundColor,
                child: Center(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    AssetHelper.getImage(product.images[0]),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 12,
                      right: 20,
                      bottom: 12,
                    ),
                    child: Text(
                      product.name,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            formatRupiah(product.price),
                            style: textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 4, 20, 4),
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgHelper(
                                width: 20,
                                assetPath: AssetHelper.getIcon(
                                  'star.svg',
                                ),
                              ),
                              Text(
                                '${product.rating}',
                                style: textTheme.titleSmall!.copyWith(
                                  color: scaffoldColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

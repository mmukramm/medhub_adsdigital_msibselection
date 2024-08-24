import 'package:flutter/material.dart';

import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/rupiah_formatter.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/main_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/verified_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/address_item.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/product/widgets/payment_item.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final List<Address> addresses;
  late final ValueNotifier<Address?> selectedAddress;
  late final List<Payment> payments;
  late final ValueNotifier<Payment?> selectedPayment;

  @override
  void initState() {
    super.initState();

    selectedAddress = ValueNotifier(null);
    selectedPayment = ValueNotifier(null);

    payments = [
      Payment(paymentImg: 'ovo.png', name: 'OVO'),
      Payment(paymentImg: 'dana.png', name: 'Dana'),
      Payment(paymentImg: 'shopeepay.png', name: 'ShopeePay'),
      Payment(paymentImg: 'gopay.png', name: 'GoPay'),
    ];

    addresses = [
      Address(
        addressName: 'Home',
        phone: '012893',
        spesificAddress: 'Jl. Rajawali No. 02 Surabaya',
      ),
      Address(
        addressName: 'Office',
        phone: '012893',
        spesificAddress: 'Jl. Gajah Mada No. 05, Sidoarjo',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(
          title: 'Checkout',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2 items in your cart',
                    style: textTheme.bodyMedium!.copyWith(
                      color: highlightColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'TOTAL',
                        style: textTheme.bodyMedium!
                            .copyWith(color: highlightColor),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatRupiah(123409),
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      ValueListenableBuilder(
                        valueListenable: selectedAddress,
                        builder: (context, addressValue, _) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final address = addresses[index];
                              return AddressItem(
                                address: address,
                                isSelected: address == addressValue,
                                onTap: () {
                                  selectedAddress.value = address;
                                },
                              );
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: addresses.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Divider(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgHelper(
                          assetPath: AssetHelper.getIcon('plus.svg'),
                          color: secondaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add Address',
                          style: textTheme.bodyMedium!
                              .copyWith(color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Payment Method',
                    style: textTheme.titleMedium,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: highlightColor),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ValueListenableBuilder(
                      valueListenable: selectedPayment,
                      builder: (context, paymentValue, _) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final payment = payments[index];
                            return PaymentItem(
                              isSelected: payment == paymentValue,
                              payment: payment,
                              onTap: () {
                                selectedPayment.value = payment;
                              },
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemCount: payments.length,
                          shrinkWrap: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState!.push(
                      MaterialPageRoute(
                        builder: (_) => VerifiedPage(
                          buttonText: 'Continue Order',
                          title: 'Thank you',
                          description:
                              'Your Order will be delivered with invoice #INV20240817. You can track the delivery in the order section.',
                          onClickButton: () {
                            navigatorKey.currentState!.push(
                              MaterialPageRoute(
                                builder: (_) => const MainPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('Pay Now ${formatRupiah(1290182)}'),
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

class Payment {
  final String paymentImg;
  final String name;

  Payment({required this.paymentImg, required this.name});
}

class Address {
  final String addressName;
  final String phone;
  final String spesificAddress;

  Address({
    required this.addressName,
    required this.phone,
    required this.spesificAddress,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';
import 'package:medhub_adsdigital_msibselection/core/utils/minute_formatter.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/app_size_helper.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/main_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/bloc/count_down_cubit.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/verified_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final formKey = GlobalKey<FormBuilderState>();
  late final ValueNotifier<bool> isFilled;
  late final CountDownCubit countDownCubit;

  @override
  void initState() {
    super.initState();
    isFilled = ValueNotifier(false);
    countDownCubit = context.read<CountDownCubit>();
    countDownCubit.startCountDown();
  }

  @override
  void dispose() {
    super.dispose();
    countDownCubit.close();
    isFilled.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fieldSize = (AppSize.getWidth(context) / 4) - 40;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Enter the verify code',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'We just send you a verification code via phone \n${widget.phoneNumber}',
                      style:
                          textTheme.bodyMedium!.copyWith(color: highlightColor),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: FormBuilder(
                    key: formKey,
                    child: SizedBox(
                      height: fieldSize,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildField(index, fieldSize),
                        separatorBuilder: (_, __) => const SizedBox(
                          width: 8,
                        ),
                        itemCount: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: isFilled,
                  builder: (context, value, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: value
                            ? () {
                                navigatorKey.currentState!.push(
                                  MaterialPageRoute(
                                    builder: (_) => VerifiedPage(
                                      title: 'Phone Number Verified',
                                      description:
                                          'Congradulations, your phone number has been verified. You can start using the app',
                                      buttonText: 'CONTINUE',
                                      onClickButton: () {
                                        navigatorKey.currentState!
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (_) => const MainPage(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              value ? primaryColor : highlightColor,
                        ),
                        child: const Text('SUBMIT CODE'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<CountDownCubit, int>(
                  builder: (context, state) {
                    final isZero = state == 0;
                    return Column(
                      children: [
                        Text(
                          'The verify code will expire in ${formatTime(state)}',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!
                              .copyWith(color: highlightColor),
                        ),
                        ElevatedButton(
                          onPressed: isZero
                              ? () {
                                  countDownCubit.startCountDown();
                                }
                              : () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Resend Code',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge!.copyWith(
                              color: isZero ? secondaryColor : highlightColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildField(int index, double size) {
    return SizedBox(
      height: size,
      width: size,
      child: FormBuilderTextField(
        name: index.toString(),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w300,
            color: highlightColor.withOpacity(.6),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: highlightColor.withOpacity(.4)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
        ),
        style: textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
        onChanged: (value) {
          if (value?.length == 1) {
            FocusManager.instance.primaryFocus?.nextFocus();

            if (index == 3) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }

          isFilled.value = checkFields();
        },
      ),
    );
  }

  bool checkFields() {
    formKey.currentState!.save();

    final values = formKey.currentState!.value.values.cast<String?>().toList();

    for (var value in values) {
      if (value == null || value.isEmpty) return false;
    }

    return true;
  }
}

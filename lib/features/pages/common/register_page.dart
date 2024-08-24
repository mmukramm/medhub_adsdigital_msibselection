import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/bloc/count_down_cubit.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/login_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/otp_page.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_app_bar.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_password_text_field.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/widgets/custom_text_field.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/keys/keys.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create your account',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      name: 'name',
                      hintText: 'Your Name',
                      labelText: 'Your Name',
                      validators: [
                        FormBuilderValidators.required(errorText: 'Required')
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      name: 'number',
                      hintText: 'Mobile Number',
                      labelText: 'Mobile Number',
                      textInputType: TextInputType.phone,
                      validators: [
                        FormBuilderValidators.required(errorText: 'Required'),
                        FormBuilderValidators.numeric(
                            errorText: 'Wrong format'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      name: 'email',
                      hintText: 'Email',
                      labelText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validators: [
                        FormBuilderValidators.required(errorText: 'Required'),
                        FormBuilderValidators.email(errorText: 'Wrong format'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomPasswordTextField(
                      name: 'password',
                      hintText: 'Password',
                      labelText: 'Password',
                      validators: [
                        FormBuilderValidators.required(errorText: 'Required')
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.saveAndValidate()) {
                            final value = formKey.currentState!.value;
                            navigatorKey.currentState!.pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (_) => CountDownCubit(),
                                  child: OtpPage(
                                    phoneNumber: value['number'],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('CREATE ACCOUNT'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    navigatorKey.currentState!.push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: -45 * math.pi,
                        child: SvgHelper(
                          assetPath: AssetHelper.getIcon('caret.svg'),
                          color: highlightColor,
                        ),
                      ),
                      Text(
                        'Don\'t have an account? Sign Up',
                        style: textTheme.bodyMedium!
                            .copyWith(color: highlightColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

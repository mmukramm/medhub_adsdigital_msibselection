import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/asset_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/helpers/svg_helper.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String name, hintText;
  final String? labelText;
  final bool isRequired;
  final int maxLines;
  final bool readOnly;
  final bool withForgot;
  final Widget? prefixIcon;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign labelTextAlign;
  final TextInputType? textInputType;
  final List<String? Function(String?)>? validators;
  final Function(String?)? onChanged;
  final VoidCallback? onTap;

  const CustomPasswordTextField({
    super.key,
    required this.name,
    this.labelText,
    this.isRequired = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.withForgot = false,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    required this.hintText,
    this.labelTextAlign = TextAlign.start,
    this.textInputType,
    this.validators,
    this.onChanged,
    this.onTap,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late final ValueNotifier<bool> isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = ValueNotifier(true);
  }

  @override
  void dispose() {
    super.dispose();
    isVisible.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder(
          valueListenable: isVisible,
          builder: (context, value, _) {
            return FormBuilderTextField(
              name: widget.name,
              obscureText: value,
              autocorrect: false,
              autofocus: false,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: textTheme.bodyMedium!.copyWith(
                  color: highlightColor,
                ),
                label:
                    widget.labelText != null ? Text(widget.labelText!) : null,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                ),
                contentPadding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
                prefixIcon: widget.prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: widget.prefixIcon,
                      )
                    : null,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgHelper(
                        assetPath: value
                            ? AssetHelper.getIcon('eye-close.svg')
                            : AssetHelper.getIcon('eye-open.svg'),
                        color: primaryColor,
                      ),
                      onPressed: () {
                        isVisible.value = !value;
                      },
                    ),
                    if (widget.withForgot)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: primaryTextColor,
                        ),
                        child: Text('Forgot?', style: textTheme.bodySmall),
                      )
                  ],
                ),
              ),
              onChanged: widget.onChanged,
              style: textTheme.bodyMedium!.copyWith(
                color: primaryTextColor,
              ),
              cursorColor: secondaryTextColor,
              maxLines: widget.maxLines,
              readOnly: widget.readOnly,
              validator: widget.validators != null
                  ? FormBuilderValidators.compose(widget.validators!)
                  : null,
              onTap: widget.onTap,
            );
          },
        ),
      ],
    );
  }
}

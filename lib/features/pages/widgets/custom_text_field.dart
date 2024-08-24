import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/colors.dart';
import 'package:medhub_adsdigital_msibselection/core/theme/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final String name, hintText;
  final String? labelText;
  final bool isRequired;
  final int maxLines;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign labelTextAlign;
  final TextAlign textAlign;
  final TextInputType? textInputType;
  final String? initialValue;
  final FocusNode? focusNode;
  final List<String? Function(String?)>? validators;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.name,
    this.labelText,
    this.isRequired = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    required this.hintText,
    this.labelTextAlign = TextAlign.start,
    this.textAlign = TextAlign.start,
    this.textInputType,
    this.initialValue,
    this.focusNode,
    this.validators,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormBuilderTextField(
          name: name,
          autofocus: false,
          autocorrect: false,
          keyboardType: textInputType,
          focusNode: focusNode,
          textInputAction: textInputAction,
          initialValue: initialValue,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          decoration: InputDecoration(
            hintText: hintText,
            label: labelText != null ? Text(labelText!) : null,
            hintStyle: textTheme.bodyMedium!.copyWith(
              color: highlightColor,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
            ),
            contentPadding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: suffixIcon,
                  )
                : null,
          ),
          style: textTheme.bodyMedium!.copyWith(
            color: primaryTextColor,
            decorationColor: secondaryColor,
          ),
          cursorColor: secondaryTextColor,
          maxLines: maxLines,
          readOnly: readOnly,
          validator: validators != null
              ? FormBuilderValidators.compose(validators!)
              : null,
          onTap: onTap,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';
import '../theme/layout_space.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({
    Key? key,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.filled,
    this.obscureText,
    this.textEditingController,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.autoValidateMode,
    this.keyboardType,
    this.autofillHints,
    this.suffixIcon,
    this.decoration,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
    this.errorColor,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.prefixText,
  }) : super(key: key);

  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? errorColor;
  final bool? filled;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textEditingController,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: autoValidateMode,
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      onTap: onTap,
      decoration: decoration ??
          InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                borderSide:
                    BorderSide(color: fillColor ?? AppColors.neutral0, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.neutral2, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                borderSide:
                    BorderSide(color: fillColor ?? AppColors.neutral0, width: 0.0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.neutral2, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                borderSide:
                    BorderSide(color: fillColor ?? AppColors.neutral0, width: 0.0),
              ),
              hintText: hintText,
              hintStyle: hintStyle ??
                  const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                  ),
              filled: filled ?? true,
              fillColor: fillColor ?? AppColors.neutral0,
              suffixIcon: suffixIcon,
              prefixText: prefixText,
              errorStyle: TextStyle(color: errorColor ?? AppColors.primary),
              contentPadding: const EdgeInsets.all(layoutSpace20)),
      minLines: minLines,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
    );
  }
}

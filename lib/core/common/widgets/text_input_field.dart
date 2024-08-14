import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.controller,
    this.filled = true,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColour,
    this.icon,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.colorFocusedBorder,
    this.colorEnabeledBorder,
    this.colorHint,
    this.textColor,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final Color? colorFocusedBorder;
  final Color? colorEnabeledBorder;
  final Color? colorHint;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: overrideValidator
          ? validator
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Harap di isi';
              }
              return validator?.call(value);
            },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      style: TextStyle(color: textColor ?? Colors.black), // Warna teks
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorEnabeledBorder ?? Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorFocusedBorder ?? Theme.of(context).primaryColor,
          ),
        ),
        icon: icon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: filled,
        fillColor: fillColour ?? Colors.grey.shade200, // Warna latar belakang
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
                fontSize: context.textDescriptionMedium,
                fontWeight: FontWeight.w500,
                color: colorHint ?? Colors.white),
      ),
    );
  }
}

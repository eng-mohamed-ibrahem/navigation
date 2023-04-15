import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomizedTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? helperText;
  final int? maxLength;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged; // anonymous function
  final List<TextInputFormatter>? inputFormatters;

  const CustomizedTextFormField(
      {super.key,
      this.controller,
      this.obscureText,
      this.autofocus,
      this.validator,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.helperText,
      this.maxLength,
      this.maxLines,
      this.onChanged,
      this.autovalidateMode,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      style: const TextStyle(fontSize: 20),
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: validator,
      autofocus: autofocus ?? false,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        labelText: labelText,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

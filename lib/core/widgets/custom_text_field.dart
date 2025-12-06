import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle textStyle;
  final String hint;
  final TextStyle hintStyle;
  final String? label;
  final TextStyle? labelStyle;

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color fillColor;

  final Color borderColor;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final bool? obscure;
  final String? obscureCharacter;
  final void Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.hint,
    required this.hintStyle,
    required this.controller,
    required this.borderColor,
    required this.fillColor,
    this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.obscure = false,
    this.obscureCharacter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autofocus: false,
      obscureText: obscure!,
      obscuringCharacter: obscureCharacter ?? "*",
      maxLines: maxLines,
      cursorColor: Theme.of(context).canvasColor,
      cursorHeight: 28.h,
      cursorWidth: 2.w,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 18.h,
        ),
        enabledBorder: builtBorder(borderColor),
        focusedBorder: builtBorder(borderColor),
        errorBorder: builtBorder(),
        focusedErrorBorder: builtBorder(),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        filled: true,
        fillColor: fillColor,
      ),
    );
  }

  OutlineInputBorder builtBorder([Color colorBorder = Colors.red]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(color: colorBorder, width: 1.5.w),
    );
  }
}

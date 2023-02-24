import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_const.dart';


class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
        required this.hintText,
        this.prefix,
        this.suffix,
        required this.textInputAction,
        this.keyboardType,
        this.obscureText,
        this.initialValue,
        required this.onChanged,
        this.margin,
        this.textAlign,
        this.validator,
        this.inputFormatters,
        this.contentPadding,
        this.height})
      : super(key: key);
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final String? initialValue;
  final void Function(String) onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final EdgeInsetsGeometry? margin;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.88,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 40.w),
      decoration: BoxDecoration(
          color: MyColors.textBarBgColor,
          borderRadius: BorderRadius.circular(100)),
      child: SizedBox(
        height: height ?? 60,
        child: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          textAlign: textAlign ?? TextAlign.center,
          cursorColor: MyColors.commonTextColor,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          validator: validator,
          inputFormatters: inputFormatters,
          style: TextStyle(color: MyColors.commonTextColor),
          decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(16, 16, 16, 16),
            hintText: hintText,
            hintStyle: TextStyle(color: MyColors.commonTextColor.withOpacity(.3)),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
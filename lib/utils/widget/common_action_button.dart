import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_const.dart';

class CommonActionButton extends StatelessWidget {
  const CommonActionButton(
      {Key? key,
        this.showBorder,
        this.showBackgroundColor,
        required this.text,
        required this.onTap,
        this.labelStyle,this.edgeInsets,this.borderRadius,this.width,this.textColor,this.bgColor})
      : super(key: key);
  final bool? showBorder;
  final bool? showBackgroundColor;
  final String text;
  final TextStyle? labelStyle;
  final VoidCallback onTap;
  final EdgeInsets? edgeInsets;
  final BorderRadius? borderRadius;
  final double? width;
  final Color? textColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?? MediaQuery.of(context).size.width*.7,
        height: 50.h,
        alignment: Alignment.center,
        margin: edgeInsets?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: showBackgroundColor ?? true
                ? bgColor
                : Colors.transparent,
            border: showBorder ?? false
                ? Border.all(color: MyColors.buttonColor,width: 2)
                : null,
            borderRadius: borderRadius?? BorderRadius.circular(20)),
        // padding: EdgeInsets.fromLTRB(80.w, 20.h, 80.h, 20.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: labelStyle ??
               GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor?? Colors.white),
        ),
      ),
    );
  }
}
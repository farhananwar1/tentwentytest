import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_const.dart';

class CommonGenreButton extends StatelessWidget {
  final String text;
  final Color bgColor;

  const CommonGenreButton({Key? key, required this.text, required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20))),
        alignment: Alignment.center,
        width: 68.w,
        height: 30.h,
        child: Text(
            text, style: GoogleFonts.poppins(color: MyColors.whiteColor)));
  }
}

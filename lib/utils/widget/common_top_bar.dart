import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty_test/utils/getx_dependencies.dart';
import 'package:tentwenty_test/utils/stringConst/asset_icon_links.dart';
import 'package:tentwenty_test/utils/theme/color_const.dart';
import 'package:tentwenty_test/utils/widget/common_text_form_field.dart';

class CommonTopBar extends StatelessWidget {
  const CommonTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return kWatchController.searchClicked.value == true
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .08,
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextField(
                    margin: EdgeInsets.zero,
                      hintText: 'TV shows, movies and more',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      obscureText: false,
                      onChanged: (newValue) {},
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 16),
                      prefix: Container(
                          padding: EdgeInsets.all(20),
                          child: Image.asset("assets/icons/search.png")),
                      suffix: GestureDetector(
                        onTap: () {
                          kWatchController.searchClicked.value = false;
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(12, 16, 14, 16),
                            child: Image.asset("assets/icons/close.png")),
                      )),
                ],
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Watch",
                    style: GoogleFonts.poppins(
                        color: MyColors.commonTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      kWatchController.searchClicked.value = true;
                    },
                    child: Image.asset(
                      AssetIconLinks.SEARCH_ICON,
                      width: 22.w,
                      height: 22.h,
                    ),
                  )
                ],
              ),
            );
    });
  }
}

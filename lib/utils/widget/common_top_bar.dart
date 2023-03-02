import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty_test/utils/getx_dependencies.dart';
import 'package:tentwenty_test/utils/stringConst/asset_icon_links.dart';
import 'package:tentwenty_test/utils/theme/color_const.dart';
import 'package:tentwenty_test/utils/widget/common_text_form_field.dart';

import '../../module/mainScreen/modules/search/view/screen/search_screen.dart';

class CommonTopBar extends StatelessWidget {
  const CommonTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()))
                  .then((value) {
                kWatchController.getMoviesResponse.value = [];
                kWatchController.searchClicked.value = false;
                kWatchController.page.value = 1;
                kWatchController.getMoviesList(
                    context, kWatchController.page.value);
              });
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
  }
}

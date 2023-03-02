import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_test/module/mainScreen/view/bottom_nav_bar.dart';
import 'package:tentwenty_test/utils/stringConst/asset_icon_links.dart';

import '../../../../../../utils/theme/color_const.dart';
import '../../../../../../utils/widget/common_action_button.dart';

class GetTicketScreen extends StatelessWidget {
  final String title;
  final String releaseDate;

  const GetTicketScreen(
      {Key? key, required this.title, required this.releaseDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(24),
        child: CommonActionButton(
          onTap: () {},
          text: 'Select Seats',
          showBackgroundColor: true,
          bgColor: MyColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Column(
            children: [
              Text(title),
              SizedBox(height: 10.h),
              Text(
                "In theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(releaseDate))}",
                style: GoogleFonts.poppins(
                  color: MyColors.buttonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              SizedBox(height: 60.h),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Date",
                  style: GoogleFonts.poppins(
                      color: MyColors.commonTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 15.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    CommonActionButton(
                      text: '5 Mar',
                      onTap: () {},
                      showBackgroundColor: true,
                      bgColor: MyColors.buttonColor,
                      width: 100.w,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    SizedBox(width: 10.w),
                    CommonActionButton(
                      text: '6 Mar',
                      onTap: () {},
                      showBackgroundColor: true,
                      bgColor: MyColors.dateCardBgColor.withOpacity(.1),
                      textColor: MyColors.commonTextColor,
                      width: 100.w,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    SizedBox(width: 10.w),
                    CommonActionButton(
                      text: '7 Mar',
                      onTap: () {},
                      showBackgroundColor: true,
                      bgColor: MyColors.dateCardBgColor.withOpacity(.1),
                      textColor: MyColors.commonTextColor,
                      width: 100.w,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    SizedBox(width: 10.w),
                    CommonActionButton(
                      text: '8 Mar',
                      onTap: () {},
                      showBackgroundColor: true,
                      bgColor: MyColors.dateCardBgColor.withOpacity(.1),
                      textColor: MyColors.commonTextColor,
                      width: 100.w,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    SizedBox(width: 10.w),
                    CommonActionButton(
                      text: '9 Mar',
                      onTap: () {},
                      showBackgroundColor: true,
                      bgColor: MyColors.dateCardBgColor.withOpacity(.1),
                      textColor: MyColors.commonTextColor,
                      width: 100.w,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, top: 50.h),
                        width: MediaQuery.of(context).size.width * .7,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10.w),
                                Text(
                                  "12:30",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      color: MyColors.commonTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Cinetech + hall 1",
                                  style: GoogleFonts.poppins(
                                      color: MyColors.overviewTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: MediaQuery.of(context).size.width * .7,
                              margin: EdgeInsets.only(
                                  left: 10.w, right: index == 4 ? 20.w : 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: index == 0
                                      ? Border.all(color: MyColors.buttonColor)
                                      : Border.all(
                                          color: MyColors.overviewTextColor
                                              .withOpacity(.2))),
                              height: 200.h,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Image.asset(AssetIconLinks.SEAT_ICON)),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                SizedBox(width: 10.w),
                                Text(
                                  "From",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      color: MyColors.overviewTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "\$50",
                                  style: GoogleFonts.poppins(
                                      color: MyColors.commonTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  " or ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      color: MyColors.overviewTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "2500 bonus",
                                  style: GoogleFonts.poppins(
                                      color: MyColors.commonTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

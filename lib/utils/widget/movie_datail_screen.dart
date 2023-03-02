import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_test/module/mainScreen/modules/getTickets/view/screen/get_ticket_screen.dart';
import 'package:tentwenty_test/utils/stringConst/asset_icon_links.dart';
import 'package:tentwenty_test/utils/widget/common_genre_button.dart';

import '../theme/color_const.dart';
import 'common_action_button.dart';

class MovieDetailScreen extends StatefulWidget {
  final String title;
  final String preImageLink;
  final String posterPath;
  final String backDropPath;
  final String overview;
  final String releaseDate;

  const MovieDetailScreen(
      {Key? key,
      required this.title,
      required this.posterPath,
      required this.backDropPath,
      required this.preImageLink,
      required this.overview,
      required this.releaseDate})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              child: Stack(children: [
                Hero(
                  tag: Key(widget.title),
                  child: Image.network(
                    widget.preImageLink + widget.backDropPath,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child:
                                CircularProgressIndicator(color: Colors.black),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Positioned(
                    top: 50,
                    right: 0,
                    left: 10,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            AssetIconLinks.BACK_ICON,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Watch',
                          style: GoogleFonts.poppins(
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 30,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "In theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(widget.releaseDate))}",
                          style: GoogleFonts.poppins(
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CommonActionButton(
                          text: 'Get Tickets',
                          showBackgroundColor: true,
                          bgColor: MyColors.buttonColor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetTicketScreen(
                                        title: widget.title,
                                        releaseDate: widget.releaseDate)));
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonActionButton(
                          text: 'Watch Trailer',
                          showBackgroundColor: false,
                          showBorder: true,
                          onTap: () {},
                        ),
                      ],
                    ))
              ]),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                alignment: Alignment.topLeft,
                child: Text(
                  "Genres",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MyColors.commonTextColor),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonGenreButton(
                      text: 'Action', bgColor: MyColors.genreBgColor1),
                  CommonGenreButton(
                      text: 'Thriller', bgColor: MyColors.genreBgColor2),
                  CommonGenreButton(
                      text: 'Science', bgColor: MyColors.genreBgColor3),
                  CommonGenreButton(
                      text: 'Fiction', bgColor: MyColors.genreBgColor4),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Overview",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MyColors.commonTextColor),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.overview,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.overviewTextColor),
                )),
            // SizedBox(height: 30.h,)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty_test/utils/getx_dependencies.dart';
import 'package:tentwenty_test/utils/widget/common_top_bar.dart';
import 'package:tentwenty_test/utils/widget/listview_movie_card.dart';

import '../../../../../../utils/theme/color_const.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoviesData();
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
          kWatchController.getMoviesList(
              context, kWatchController.page.value + 1);
        }
      }
    });
  }

  getMoviesData() {
    kWatchController.searchClicked.value = false;
    kWatchController.page.value = 1;
    kWatchController.getMoviesResponse.value = [];
    kWatchController.getMoviesList(context, kWatchController.page.value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const CommonTopBar(),
            SizedBox(
              height: 10.h,
            ),
            Obx(() {
              return kWatchController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : kWatchController.getMoviesResponse.isEmpty
                      ? Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      "No Movies found",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.bottomNavBarColor
                                              .withOpacity(.78)),
                                    ),
                                  )
                                ],
                              )),
                        )
                      : Expanded(
                          child: Container(
                            color: MyColors.lightWhiteColor,
                            child: ListView.builder(
                              shrinkWrap: true,
                              controller: controller,
                              itemCount:
                                  kWatchController.getMoviesResponse.length,
                              itemBuilder: (context, index) {
                                final title = kWatchController
                                    .getMoviesResponse[index]['title'];
                                final backDropPath = kWatchController
                                    .getMoviesResponse[index]['backdrop_path'];
                                final posterPath = kWatchController
                                    .getMoviesResponse[index]['poster_path'];
                                final overview = kWatchController
                                    .getMoviesResponse[index]['overview'];
                                final releaseDate = kWatchController
                                    .getMoviesResponse[index]['release_date'];
                                const preImageLink =
                                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/";
                                return ListViewMovieCard(
                                    title: title,
                                    posterPath: posterPath,
                                    backDropPath: backDropPath,
                                    preImageLink: preImageLink,
                                    overview: overview,
                                    releaseDate: releaseDate);
                              },
                            ),
                          ),
                        );
            }),
            SizedBox(
              height: 80.h,
            )
          ],
        ));
  }
}

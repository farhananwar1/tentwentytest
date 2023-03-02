import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tentwenty_test/utils/getx_dependencies.dart';
import 'package:tentwenty_test/utils/theme/color_const.dart';

import '../../../../../../utils/widget/common_grid_view_tile.dart';
import '../../../../../../utils/widget/common_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = ScrollController();
  TextEditingController textEditingController = TextEditingController();

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
          kSearchController.getMoviesList(
              context, kSearchController.page.value + 1);
        }
      }
    });
  }

  getMoviesData() {
    kSearchController.searchClicked.value = false;
    kSearchController.page.value = 1;
    kSearchController.getMoviesResponse.value = [];
    kSearchController.getMoviesList(context, kSearchController.page.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Container(
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
                        controller: textEditingController,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 10, 0, 16),
                        prefix: Container(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset("assets/icons/search.png")),
                        suffix: GestureDetector(
                          onTap: () {
                            kWatchController.searchClicked.value = false;
                            textEditingController.text = '';
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Container(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Image.asset("assets/icons/close.png")),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Obx(() {
                return kSearchController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : kSearchController.getMoviesResponse.isEmpty
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: GridView.builder(
                                controller: controller,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10.h,
                                  mainAxisExtent: 120.h,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.w,
                                ),
                                itemCount:
                                    kSearchController.getMoviesResponse.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final title = kSearchController
                                      .getMoviesResponse[index]['title'];
                                  final backDropPath =
                                      kSearchController.getMoviesResponse[index]
                                          ['backdrop_path'];
                                  final posterPath = kSearchController
                                      .getMoviesResponse[index]['poster_path'];
                                  final overview = kSearchController
                                      .getMoviesResponse[index]['overview'];
                                  final releaseDate = kSearchController
                                      .getMoviesResponse[index]['release_date'];

                                  const preImageLink =
                                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/";
                                  return CommonGridViewTile(
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
              })
            ],
          )),
        ],
      ),
    );
  }
}

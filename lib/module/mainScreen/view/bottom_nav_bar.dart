import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../utils/enums.dart';
import '../../../utils/getx_dependencies.dart';
import '../../../utils/stringConst/asset_icon_links.dart';
import '../../../utils/theme/color_const.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            color: MyColors.bottomNavBarColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => BottomNavBarButton(
                      iconLink: AssetIconLinks.DASHBOARD_ICON,
                      isSelected: kMainScreenController.selectedModule.value ==
                          MainScreenModules.dashboard,
                      onTap: () {
                        kMainScreenController.selectedModule.value =
                            MainScreenModules.dashboard;
                      },
                      title: 'Dashboard',
                    ),
                  ),
                  Obx(
                    () => BottomNavBarButton(
                      iconLink: AssetIconLinks.WATCH_ICON,
                      isSelected: kMainScreenController.selectedModule.value ==
                          MainScreenModules.watch,
                      onTap: () {
                        kMainScreenController.selectedModule.value =
                            MainScreenModules.watch;
                      },
                      title: 'Watch',
                    ),
                  ),
                  Obx(
                    () => BottomNavBarButton(
                      iconLink: AssetIconLinks.MEDIA_LIBRARY_ICON,
                      isSelected: kMainScreenController.selectedModule.value ==
                          MainScreenModules.mediaLibrary,
                      onTap: () {
                        kMainScreenController.selectedModule.value =
                            MainScreenModules.mediaLibrary;
                      },
                      title: 'Media Library',
                    ),
                  ),
                  Obx(
                    () => BottomNavBarButton(
                      iconLink: AssetIconLinks.MORE_ICON,
                      isSelected: kMainScreenController.selectedModule.value ==
                          MainScreenModules.more,
                      onTap: () {
                        kMainScreenController.selectedModule.value =
                            MainScreenModules.more;
                      },
                      title: 'More',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton(
      {Key? key,
      required this.isSelected,
      required this.iconLink,
      required this.onTap,
      required this.title})
      : super(key: key);
  final bool isSelected;
  final String iconLink;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 80.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isSelected
                ? Center(
                    child: Image.asset(
                      iconLink,
                      height: 24.h,
                      width: 24.w,
                      color: MyColors.whiteColor,
                    ),
                  )
                : Center(
                    child: Image.asset(
                      iconLink,
                      height: 24.h,
                      width: 24.w,
                      color: MyColors.greyColor,
                    ),
                  ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color: isSelected ? MyColors.whiteColor : null,
              ),
            ),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}

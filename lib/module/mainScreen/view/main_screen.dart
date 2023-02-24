// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tentwenty_test/module/mainScreen/modules/dashboard/view/screen/dashboard_screen.dart';
import 'package:tentwenty_test/module/mainScreen/modules/mediaLibrary/view/screen/media_library_screen.dart';
import 'package:tentwenty_test/module/mainScreen/modules/more/view/screen/more_screen.dart';
import 'package:tentwenty_test/module/mainScreen/modules/watch/view/screen/watch_screen.dart';
import 'package:tentwenty_test/utils/enums.dart';
import 'package:tentwenty_test/utils/getx_dependencies.dart';
import 'bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    kMainScreenController.selectedModule.value = MainScreenModules.watch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () {
                      switch (kMainScreenController.selectedModule.value) {
                        case MainScreenModules.dashboard:
                          return const DashboardScreen();
                        case MainScreenModules.watch:
                          return const WatchScreen();
                        case MainScreenModules.mediaLibrary:
                          return const MediaLibraryScreen();
                        case MainScreenModules.more:
                          return const MoreScreen();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}

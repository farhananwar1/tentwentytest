import 'package:get/instance_manager.dart';
import 'package:tentwenty_test/core/network_service.dart';
import 'package:tentwenty_test/core/repository.dart';
import 'package:tentwenty_test/module/mainScreen/modules/search/controller/SearchController.dart';

import '../module/mainScreen/controller/MainScreenController.dart';
import '../module/mainScreen/modules/watch/controller/WatchController.dart';

final kMainScreenController = Get.put(MainScreenController());

///Watch Controller
final kWatchController = Get.put(
    WatchController(repository: Repository(networkService: NetworkService())));

///Search Controller
final kSearchController = Get.put(
    SearchController(repository: Repository(networkService: NetworkService())));

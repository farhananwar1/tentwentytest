import 'package:get/instance_manager.dart';
import 'package:tentwenty_test/core/network_service.dart';
import 'package:tentwenty_test/core/repository.dart';

import '../module/mainScreen/controller/MainScreenController.dart';
import '../module/mainScreen/modules/watch/controller/WatchController.dart';

final kMainScreenController = Get.put(MainScreenController());
final kWatchController = Get.put(
    WatchController(repository: Repository(networkService: NetworkService())));

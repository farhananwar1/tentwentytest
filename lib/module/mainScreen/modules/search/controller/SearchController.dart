import 'package:get/get.dart';

import '../../../../../core/repository.dart';
import '../../../../../utils/overlay_progress_bar/overlay_progress_bar.dart';

class SearchController extends GetxController{
  final Repository repository;

  SearchController({required this.repository});

  RxBool isLoading = false.obs;
  RxList getMoviesResponse = [].obs;
  RxInt page = 1.obs;
  RxBool searchClicked = false.obs;

  ProgressBar? _sendingMsgProgressBar = ProgressBar();

  void showSendingProgressBar(context) {
    _sendingMsgProgressBar!.show(context);
  }

  void hideSendingProgressBar() {
    _sendingMsgProgressBar!.hide();
  }

  @override
  void dispose() {
    _sendingMsgProgressBar!.hide();
    super.dispose();
  }

  getMoviesList(context, page) {
    if (page == 1) {
      isLoading.value = true;
      hideSendingProgressBar();
    } else {
      isLoading.value = false;
      showSendingProgressBar(context);
    }
    repository.getMoviesList(page).then((res) {
      if (res[0] == true) {
        hideSendingProgressBar();
        isLoading.value = false;
        getMoviesResponse.value =[...getMoviesResponse, ...res[2]];
      } else {
        isLoading.value = false;
        hideSendingProgressBar();
        Get.snackbar('Error', res[2], snackPosition: SnackPosition.TOP);
      }
    });
  }
}
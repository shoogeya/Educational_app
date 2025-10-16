import 'package:get/get.dart';

import '../values/utils/custom_easy_loading.util.dart';

class LoadingController extends GetxController {
  // Observable variable to track the loading state
  var isLoading = false.obs;

  // Method to show loading
  void showLoading() {
    isLoading.value = true;
    CustomEasyLoading.show();
  }

  // Method to hide loading
  void hideLoading() {
    isLoading.value = false;
    CustomEasyLoading.dismiss();
  }
}
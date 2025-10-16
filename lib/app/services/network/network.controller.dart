import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:masar/app/core/values/utils/custom_easy_loading.util.dart';
import 'package:masar/app_Imports.dart';
import '../../core/values/utils/connection.utils.dart';
import '../../layout/main_navigation.controller.dart';
import '../../routes/app_routes.dart';

enum InternetState {
  connected,
  noConnection,
  loading,
}

class NetworkController extends GetxController with ShowSnackBar {
  late var connectionStatus = 3.obs;
  final Connectivity _connectivity = Connectivity();
  static NetworkController get to => Get.find();
  late Rx<InternetState> internetState = InternetState.loading.obs;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {    initConnectivity();
  _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        (List<ConnectivityResult> results) {
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first);
      } else {
        _updateConnectionStatus(ConnectivityResult.none);
      }
    },
  );
    super.onInit();

  }

  Future<bool> initConnectivity() async {
    late ConnectivityResult result;
    try {
      var x = await _connectivity.checkConnectivity();
      result = x.first;
    } catch (e) {
      log('initConnectivity $e');
    }

    return _updateConnectionStatus(result);
  }

  bool _updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        changeState(InternetState.connected);
        connectionStatus.value = 1;
        log('ConnectivityResult.wifi');

        return true;
      case ConnectivityResult.mobile:
        changeState(InternetState.connected);

        connectionStatus.value = 2;
        log('ConnectivityResult.mobile');
        return true;
      case ConnectivityResult.none:
        changeState(InternetState.noConnection);

        connectionStatus.value = 0;
        log('ConnectivityResult.none');
        checkNetwork();

        // getSheetError('no_internet'.tr);

        return false;
      case null:
        changeState(InternetState.noConnection);

        log('ConnectivityResult.null');
        checkNetwork();
        // getSheetError('no_internet'.tr);

        return false;
      default:
        changeState(InternetState.noConnection);
        checkNetwork();

        // getSheetError('no_internet'.tr);
        return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  void changeState(InternetState newState) async {
    internetState.value = InternetState.loading;

    bool connected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } catch (_) {
      connected = false;
    }

    internetState.value = newState;
    if (newState == InternetState.connected) {
      if (Get.currentRoute == AppRoutes.signUp) {
        if (connected) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              showSnackBar(
                content: 'تم استعادة اتصال الإنترنت',
              );
            },
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              Get.toNamed(
                AppRoutes.internet,
                arguments: null,
              );
              // showSnackBar(
              //   content: 'يرجى التحقق من اتصالك بالإنترنت',
              // );
            },
          );
        }
      } else if (Get.currentRoute == AppRoutes.main &&
          Get.find<MainNavigationController>().index == 0) {
        if (connected) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              showSnackBar(
                content: 'تم استعادة اتصال الإنترنت',
              );
            },
          );
          // Get.find<HomeController>().reLoadHome();
        } else {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              // showSnackBar(
              //   content: 'يرجى التحقق من اتصالك بالإنترنت',
              // );
              Get.toNamed(
                AppRoutes.internet,
                arguments: null,
              );
            },
          );
        }
      } else if (Get.currentRoute == AppRoutes.internet) {
        if (connected) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              showSnackBar(
                content: 'تم استعادة اتصال الإنترنت',
              );
            },
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              showSnackBar(
                content: 'يرجى التحقق من اتصالك بالإنترنت',
              );
            },
          );
        }
      }
    }
  }

  void checkNetwork() async {
    bool connected = false;
    bool hasLoading = CustomEasyLoading.isShow;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } catch (_) {
      connected = false;
    }

    if (!connected) {
      if (hasLoading) {
        CustomEasyLoading.dismiss();
      }
      if (Get.currentRoute == AppRoutes.main &&
          Get.find<MainNavigationController>().index == 0) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            // showSnackBar(
            //   content: 'يرجى التحقق من اتصالك بالإنترنت',
            // );
            Get.toNamed(
              AppRoutes.internet,
              arguments: null,
            );
          },
        );
        return;
      } else {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            // showSnackBar(
            //   content: 'يرجى التحقق من اتصالك بالإنترنت',
            // );
            Get.toNamed(
              AppRoutes.internet,
              arguments: null,
            );
          },
        );
      }
      if (hasLoading) {
        CustomEasyLoading.show();
      }
    }
  }
}

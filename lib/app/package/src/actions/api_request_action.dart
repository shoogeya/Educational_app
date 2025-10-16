// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:masar/app/core/managers/user.manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../layout/main_navigation.controller.dart';
import '../api_request.dart';
import '../api_request_client.dart';
import '../api_request_exception.dart';
import '../api_request_options.dart';
import '../performance/api_request.performance.dart';
import '../performance/performance.report.dart';
import '../utils/api_request_utils.dart';
import 'package:get/get.dart' as getx;

enum RequestMethod { GET, POST, PUT, DELETE }

typedef ResponseBuilder<T> = T Function(dynamic);

abstract class ApiRequestAction<T> {
  ApiRequestAction() {
    _requestClient?.configAuth(authRequired);
    _handleRequest();
    _performanceUtils?.init(runtimeType.toString(),
        ApiRequestOptions.instance!.baseUrl + _dynamicPath);
  }

  final RequestClient? _requestClient = RequestClient.instance;
  final ApiRequestPerformance? _performanceUtils =
      ApiRequestPerformance.instance;

  ContentDataType? get contentDataType => null;

  bool get authRequired => false;

  String get path;
  dynamic get toMap => {};
  RequestMethod get method;

  late String _dynamicPath;

  ResponseBuilder<T> get responseBuilder;
  var dataMap;

  Future<Either<ApiRequestException, T?>> run() async {
    Response? response;
    Either<ApiRequestException, T?>? toReturn;
    try {
      await _execute().then(
            (value) {
          response = value;
        },
      );
    } catch (e) {
      if (e is DioException) {
        String stausMessage = "";
        if ((e.response?.statusCode ?? 500) >= 500 &&
            ((e.response?.statusCode ?? 500) != 401)) {
          stausMessage = "حدث خطآ ما";
        } else {
          stausMessage = e.response?.statusMessage ?? e.error.toString();
        }
        if (getx.Get.isDialogOpen == false &&
            getx.Get.find<MainNavigationController>().index > 0) {
          EasyLoading.dismiss();

          toReturn = left(ApiRequestException(
              response: e.response,
              statusCode: e.response?.statusCode ?? 0,
              error: e.error,
              statusMessage: stausMessage));
        }
      } else {
        if (getx.Get.isDialogOpen == false &&
            getx.Get.find<MainNavigationController>().index > 0) {
          EasyLoading.dismiss();

          toReturn = left(ApiRequestException(
              error: e,
              statusCode: 0,
              //todo add here
              statusMessage: ""));
        }
      }
    }

    if (response != null) {
      int statusCode = response?.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        if (response?.data?.toString() == "null") {
          EasyLoading.dismiss();

          toReturn = left(ApiRequestException(
            statusCode: 500,
            statusMessage: "حدث خطآ ما",
          ));
        } else {
          toReturn =
              right(responseBuilder(response?.data ?? <String, dynamic>{}));
        }
      } else {
        String stausMessage = "";
        if ((response?.statusCode ?? 500) >= 500 &&
            ((response?.statusCode ?? 500) != 401)) {
          stausMessage = "حدث خطآ ما";
        } else if(response?.statusCode == 401){
          stausMessage = response?.statusMessage ?? "";
           Get.find<UserManager>().logout();
        } else  {
          stausMessage = response?.statusMessage ?? "";
        }
        // Logger().e('error ${response?.statusMessage.toString()}');
        if (getx.Get.isDialogOpen == false) {
          EasyLoading.dismiss();
          toReturn = left(
            ApiRequestException(
              statusCode: statusCode,
              response: response,
              statusMessage: stausMessage,
              // errors: response?.data?["errors"],
            ),
          );
        }
      }
    }
    if(toReturn==null){
      EasyLoading.dismiss();
    }
    return toReturn!;
  }

  Future<Response?> _execute() async {
    _performanceUtils?.startTrack();
    Response? response;
    switch (method) {
      case RequestMethod.GET:
        response = await get();
        break;
      case RequestMethod.POST:
        response = await post();
        break;
      case RequestMethod.PUT:
        response = await put();
        break;
      case RequestMethod.DELETE:
        response = await delete();
        break;
    }
    _performanceUtils?.endTrack();

    return response;
  }

  PerformanceReport? get performanceReport => _performanceUtils?.getReport();

  Future<Response?> get() async {
    Response? response;
    await _requestClient?.dio
        .get(
      _dynamicPath,
      queryParameters: dataMap,
    )
        .then(
          (value) {
        response = value;
      },
    ).catchError(
          (e) {
        if (e is DioException && (e.response != null)) {
          response = e.response;
        } else {
          throw e;
        }
      },
    );
    return response;
  }

  Future<Response?> post() async {
    Response? response;
    try{
      await _requestClient?.dio
          .post(
        _dynamicPath,
        data: dataMap,
      )
          .then((value) {
        response = value;
      }).catchError(
            (e) {
          EasyLoading.dismiss();

          if (e is DioException && (e.response != null)) {
            response = e.response;
          } else {
            throw e;
          }
        },
      );
      return response;
    }on DioException catch (e) {
      EasyLoading.dismiss();

      // Handle Dio exceptions
      if (e.response != null) {
        response = e.response;
        // Handle specific Dio errors here (e.g., 404, 500, etc.)
        EasyLoading.showError('Error: ${e.response?.statusMessage}');
      } else {
        EasyLoading.showError('Error: ${e.message}');
      }
    }
  }
  Future<Response?> put() async {
    Response? response;
    await _requestClient?.dio
        .put(
      _dynamicPath,
      data: dataMap,
    )
        .then(
          (value) {
        response = value;
      },
    ).catchError(
          (e) {
        if (e is DioException && (e.response != null)) {
          response = e.response;
        } else {
          throw e;
        }
      },
    );

    return response;
  }

  Future<Response?> delete() async {
    Response? response;
    await _requestClient?.dio
        .delete(
      _dynamicPath,
      data: dataMap,
    )
        .then((value) {
      response = value;
    }).catchError(
          (e) {
        if (e is DioException && (e.response != null)) {
          response = e.response;
        } else {
          throw e;
        }
      },
    );

    return response;
  }

  _handleRequest() {
    Map<String, dynamic> newData = ApiRequestUtils.handleDynamicPathWithData(
        path, toMap.isNotEmpty ? toMap : {});
    _dynamicPath = newData['path'];
    dataMap = newData['data'];
    if ((contentDataType == ContentDataType.formData) &&
        method != RequestMethod.GET) {
      dataMap = FormData.fromMap(
          newData['data'], ApiRequestOptions.instance!.listFormat);
    } else {
      dataMap = newData['data'];
    }
  }

}


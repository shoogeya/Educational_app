
mixin BaseResponseModel {
  int? code;
  bool? success;
  String? message;
  String? title;
  String? token;
  int? recordCount;
  bool? hasMore;
  int? currentPageIndex;
  int? userId;
  bool? isMaintenanceModeOn;
  String? details;
  int? courseID;
  int? sectionID;
String? eUserID;
  fromJson(Map<String, dynamic> json) {
    code = json["code"];
    success = json["success"];
    userId = json["userId"];
    title = json["title"];
    message = json["message"];
    token = json["token"];
    recordCount = json['recordCount'] ?? json["totalRows"];
    hasMore = json['hasMore'];
    currentPageIndex = json['currentPageIndex'];
    isMaintenanceModeOn = json['isMaintenanceModeOn'];
    details = json['details'];
    courseID = json['courseID'];
    sectionID = json['sectionID'];
    eUserID =json['eUserID'];
  }
}

class ObjectResponse<T> with BaseResponseModel {
  T? object;
  ObjectResponse.fromJson(Map<String, dynamic> json, String key,
      T Function(Map<String, dynamic> data) builder) {
    super.fromJson(json);
    if (json[key] != null) {
      object = builder(json[key] ?? {});
    }
  }
}
class BaseResponseGeneral with BaseResponseModel {
  BaseResponseGeneral.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    message = json["message"];
    code = json["code"];
    success = json["success"];
    courseID = json['courseID'];
    sectionID = json['sectionID'];
    eUserID = json['eUserID'];
  }
}

class DataResponse<T> with BaseResponseModel {
  List<T> data = [];

  DataResponse.fromJson(Map<String, dynamic> json, String key,
      T Function(Map<String, dynamic> data) builder) {
    super.fromJson(json);
    if (json[key] != null) {
      for (var item in json[key]) {
        data.add(builder(item));
      }
    }
  }
}
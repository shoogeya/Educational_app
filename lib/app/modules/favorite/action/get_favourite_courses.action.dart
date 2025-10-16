import '../../../data/models/data_response.model.dart';
import '../../../data/providers/local_storage_provider.dart';
import '../../../package/src/actions/api_request_action.dart';
import '../../myCourses/model/course.model.dart';

class GetFavouriteCoursesAction extends ApiRequestAction<DataResponse<CourseModel>> {
  final int pageNo;
  GetFavouriteCoursesAction(this.pageNo);
  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path =>
      "Course/GetFavouriteCourses";
  @override
  Map<String, dynamic> get toMap => {
    "languageID": LocalStorageProvider.languageId,
    'pageNo': pageNo,
    'pageSize': 10,
  };
  @override
  ResponseBuilder<DataResponse<CourseModel>> get responseBuilder =>
          (json) => DataResponse.fromJson(
          json, "courses", ((data) => CourseModel.fromJson(data)));
}

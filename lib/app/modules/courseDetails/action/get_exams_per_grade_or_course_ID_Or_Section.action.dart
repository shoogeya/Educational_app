import '../../../data/models/data_response.model.dart';
import '../../../data/providers/local_storage_provider.dart';
import '../../../package/src/actions/api_request_action.dart';
import '../models/exam_model.dart';

class GetExamsPerGradeOrCourseIDOrSectionAction
    extends ApiRequestAction<DataResponse<ExamModel>> {
  int? pageNo;
  int? gradeID;
  int? courseID;
  int? sectionID;

  GetExamsPerGradeOrCourseIDOrSectionAction(
      this.pageNo, this.gradeID, this.courseID, this.sectionID);

  @override
  bool get authRequired => true;

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get path => "Exam/GetExamsPerGradeOrCourseIDOrSection";

  @override
  Map<String, dynamic> get toMap => {
        "languageID": LocalStorageProvider.languageId,
        "pageNo": pageNo,
        'pageSize': 10,
        'courseID': courseID,
        'sectionID': sectionID,
        'gradeID': gradeID
      };

  @override
  ResponseBuilder<DataResponse<ExamModel>> get responseBuilder =>
      (json) => DataResponse.fromJson(
          json, "exams", ((data) => ExamModel.fromJson(data)));
}

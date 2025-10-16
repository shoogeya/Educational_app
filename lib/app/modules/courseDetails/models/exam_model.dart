import 'package:get/get.dart';
import 'package:masar/app/modules/courseDetails/models/question_exam.dart';
import '../../../core/managers/app.manager.dart';

class ExamModel {
  int? languageID;
  int? examID;
  int? gradeID;
  int? subjectID;
  int? courseID;
  int? userID;
  int? sectionID;
  bool? isSubmittedBefore;
  int? result;
  String? courseName;
  List<QuestionExam>? questions;
  String? get subjectTitle {
    return Get.find<AppManager>().subjects.firstWhereOrNull((element) => element.subjectID == subjectID)?.subjectTitle ?? "";
  }
  String? examTitle;
  ExamModel({
    this.languageID,
    this.examID,
    this.gradeID,
    this.subjectID,
    this.courseID,
    this.userID,
    this.sectionID,
    this.isSubmittedBefore,
    this.result,
    this.questions,this.courseName,this.examTitle
  });

  ExamModel.fromJson(Map<String, dynamic> json) {
    courseName = json['courseTitle'];
    languageID = json['languageID'];
    examID = json['examID'];
    gradeID = json['gradeID'];
    subjectID = json['subjectID'];
    courseID = json['courseID'];
    userID = json['userID'];
    sectionID = json['sectionID'];
    isSubmittedBefore = json['isSubmittedBefore'];
    result = json['result'];
    examTitle = json['examTitle'];
    if (json['questions'] != null) {
      questions = <QuestionExam>[];
      json['questions'].forEach((v) {
        questions!.add(QuestionExam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'languageID': languageID,
      'examID': examID,
      'gradeID': gradeID,
      'subjectID': subjectID,
      'courseID': courseID,
      'userID': userID,
      'sectionID': sectionID,
      'isSubmittedBefore': isSubmittedBefore,
      'result': result,
      'questions': questions?.map((e) => e.toJson()).toList(),
    };
  }
}
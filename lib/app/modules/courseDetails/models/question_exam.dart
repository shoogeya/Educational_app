import 'answer_exam.dart';

class QuestionExam{
  int? languageID;
  int? examID;
  String? questionText;
  int? questionID;
  String? questionImage;
  String? questionImageName;
  List<AnswerExam>? answers;
  int get correctAnswerIndex {
    return answers?.indexWhere((e) => e.isCorrect == true) ?? 0;
  }


  QuestionExam({
    this.examID,
    this.questionID,this.languageID,this.questionText,this.answers,this.questionImage,this.questionImageName
  });
  QuestionExam.fromJson(Map<String, dynamic> json) {
    questionImage = json['questionImage'];
    languageID = json['languageID'];
    examID = json['examID'];
    questionText = json['questionText'];
    questionID = json['questionID'];
    questionImageName = json['questionImageName'];
    if (json['answers'] != null) {
      answers = <AnswerExam>[];
      json['answers'].forEach((v) {
        answers!.add(AnswerExam.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    return {
      'questionImage': questionImage,
      'languageID': languageID,
      'examID': examID,
      'questionText': questionText,
      'questionID': questionID,
      'answers': answers?.map((e) => e.toJson()).toList(),
    };
  }

}

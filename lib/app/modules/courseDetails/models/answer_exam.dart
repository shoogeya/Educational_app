
class AnswerExam{
  int? questionID;
  int? answerID;
  String? answerText;
  bool? isCorrect;
  bool? isSelectedByUser;

  AnswerExam({this.questionID,this.answerID,this.answerText,this.isCorrect,this.isSelectedByUser});
  AnswerExam.fromJson(Map<String, dynamic> json) {
    questionID = json['questionID'];
    answerID = json['answerID'];
    answerText = json['answerText'];
    isCorrect = json['isCorrect'];
    isSelectedByUser = json['isSelectedByUser'];
  }

  Map<String, dynamic> toJson() {
    return {
      'questionID': questionID,
      'answerID': answerID,
      'answerText': answerText,
      'isCorrect': isCorrect,
    };
  }
}
import '../../../data/models/action_selectable.dart';

enum TypeOfUploaded {
  file,
  quiz;

  String get title {
    switch (this) {
      case TypeOfUploaded.file:
        return "إضافة ملف ";
      case TypeOfUploaded.quiz:
        return "إضافة اختبار ";
    }
  }

  static List<ActionSelectable> get studantList {
    return [
      BaseSelectableModel(
        TypeOfUploaded.file.index,
        TypeOfUploaded.file.title,
      )];
  }
  static List<ActionSelectable> get teacherList {
    return [
      BaseSelectableModel(
        TypeOfUploaded.file.index,
        TypeOfUploaded.file.title,
      ),
      BaseSelectableModel(
        TypeOfUploaded.quiz.index,
        TypeOfUploaded.quiz.title,
      ),
    ];
  }
}
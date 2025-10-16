import 'action_selectable.dart';

class GradeModel extends ActionSelectable {
  int? gradeID;
  String? gradeDescription;
  GradeModel(
      {this.gradeID,
        this.gradeDescription});

  GradeModel.fromJson(Map<String, dynamic> json) {
    gradeID = json['gradeID'];
    gradeDescription = json['gradeDescription'];
  }

  Map<String, dynamic> toJson() {
    return {
      'gradeID': gradeID,
      'gradeDescription': gradeDescription
    };
  }

  @override
  // TODO: implement selectableCountryCode
  String? get selectableCountryCode => null;

  @override
  // TODO: implement selectableImage
  String? get selectableImage => null;

  @override
  // TODO: implement selectableName
  String get selectableName => gradeDescription ?? "";

}

import 'action_selectable.dart';

class SectionModel extends ActionSelectable {
  int? sectionID;
  String? sectionDescription;
  SectionModel(
      {this.sectionID,
        this.sectionDescription});

  SectionModel.fromJson(Map<String, dynamic> json) {
    sectionID = json['gradeID'];
    sectionDescription = json['gradeDescription'];
  }

  Map<String, dynamic> toJson() {
    return {
      'gradeID': sectionID,
      'gradeDescription': sectionDescription
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
  String get selectableName => sectionDescription ?? "";

}

import 'action_selectable.dart';

class GenderModel extends ActionSelectable {
  int? genderID;
  String? genderName;
  GenderModel(
      {this.genderID,
        this.genderName});

  GenderModel.fromJson(Map<String, dynamic> json) {
    genderID = json['gradeID'];
    genderName = json['genderName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'genderID': genderID,
      'genderName': genderName
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
  String get selectableName => genderName ?? "";

}

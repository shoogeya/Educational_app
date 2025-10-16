import 'action_selectable.dart';


class SubjectModel extends ActionSelectable {
  int? subjectID;
  String? subjectTitle;
  SubjectModel(
      {this.subjectID,
        this.subjectTitle});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    subjectID = json['subjectID'];
    subjectTitle = json['subjectTitle'];
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectID': subjectID,
      'subjectTitle': subjectTitle
    };
  }
  @override
  String? get selectableCountryCode => null;
  @override
  String? get selectableImage => null;
  @override
  String get selectableName => subjectTitle ?? "";

}

class FileLibraryModel extends ActionSelectable {
  int? fileID;
  String? fileTitle;
  FileLibraryModel(
      {this.fileID,
        this.fileTitle});

  FileLibraryModel.fromJson(Map<String, dynamic> json) {
    fileID = json['fileID'];
    fileTitle = json['fileTitle'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fileID': fileID,
      'fileTitle': fileTitle
    };
  }
  @override
  String? get selectableCountryCode => null;
  @override
  String? get selectableImage => null;
  @override
  String get selectableName => fileTitle ?? "";

}
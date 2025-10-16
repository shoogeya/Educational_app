import 'action_selectable.dart';

class FileDropDawnModel extends ActionSelectable {
  int? fileID;
  String? fileTitle;
  FileDropDawnModel(
      {this.fileID,
        this.fileTitle});


  @override
  // TODO: implement selectableCountryCode
  String? get selectableCountryCode => null;

  @override
  // TODO: implement selectableImage
  String? get selectableImage => null;

  @override
  // TODO: implement selectableName
  String get selectableName => fileTitle ?? "";

}

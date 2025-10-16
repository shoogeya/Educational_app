import 'action_selectable.dart';

class SeasonModel extends ActionSelectable {
  int? seasonID;
  String? seasonTitle;

  SeasonModel(
      {this.seasonID,
        this.seasonTitle});


  @override
  String? get selectableImage => null;

  @override
  String get selectableName => seasonTitle ?? "";

  @override
  String? get selectableCountryCode => null;
}

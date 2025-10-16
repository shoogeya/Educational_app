import 'action_selectable.dart';

class CityModel extends ActionSelectable {
  int? cityID;
  String? cityName;
  int? countryID;

  CityModel(
      {this.cityID,
        this.cityName,
        this.countryID});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityID = json['cityID'];
    cityName = json['cityName'];
    countryID = json['countryID'];
  }
  Map<String, dynamic> toJson() {
    return {
      'cityID': cityID,
      'cityName': cityName,
      'countryID': countryID,
    };
  }

  @override
  String? get selectableImage => null;

  @override
  String get selectableName => cityName ?? "";

  @override
  String? get selectableCountryCode => null;
}

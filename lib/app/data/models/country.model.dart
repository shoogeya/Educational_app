import 'action_selectable.dart';

class CountryModel extends ActionSelectable {
  int? countryID;
  String? countryCode;
  String? countryFlagURL;
  String? countryDialingCode;
  String? profileCountryName;
  String? selectedCountry;
  int? profileOrderNum;
  CurrencyModel? currency;

  CountryModel(
      {this.countryID,
        this.countryCode,
        this.countryFlagURL,
        this.countryDialingCode,
        this.profileCountryName,
        this.profileOrderNum});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryID = json['countryID'];
    countryCode = json['countryCode'];
    countryFlagURL = json['countryFlagURL'];
    countryDialingCode = json['countryDialingCode'];
    profileCountryName = json['profileCountryName'];
    profileOrderNum = json['profileOrderNum'];
    currency = json['currency'] != null
        ? CurrencyModel.fromJson(json['currency'])
        : null;
  }
  Map<String, dynamic> toJson() {
    return {
      'countryID': countryID,
      'countryCode': countryCode,
      'countryFlagURL': countryFlagURL,
      'countryDialingCode': countryDialingCode,
      'profileCountryName': profileCountryName,
      'profileOrderNum': profileOrderNum,
      'currency' :currency
    };
  }

  @override
  String? get selectableImage => countryFlagURL;

  @override
  String get selectableName => profileCountryName ?? "";

  @override
  String? get selectableCountryCode => countryDialingCode;
}


class CurrencyModel{
  int? currencyID;
  String? currencyName;
  String? currencySymbol;
  String? currencyCode;

  CurrencyModel(
      {this.currencyID,
        this.currencyName,
        this.currencySymbol,
        this.currencyCode});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    currencyID = json['currencyID'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    currencyCode = json['currencyCode'];
  }
  Map<String, dynamic> toJson() {
    return {
      'currencyID': currencyID,
      'currencyName': currencyName,
      'currencySymbol': currencySymbol,
      'currencyCode': currencyCode,
    };
  }

}

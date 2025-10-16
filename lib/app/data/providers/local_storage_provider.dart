import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import '../models/country.model.dart';
class LocalStorageProvider {
  final String _token = "token";
  final String _name = "name";
  final String _userId = "user_id";
  final String _userName = "user_name";
  final String _userType = "user_type";
  final String _isAuthed = "is_authed";
  final String _firstTime = "first_time";
  final String _user = "user";
  final String _studant = "studant";
  final String _teacher = "teacher";
  final String _deviceId = "deviceId";
  final String _isUserSkipOnBoarding = "isUserSkipOnBoarding";
  static const String _languageId = "languageId";
  static const String _listCountries = "countries";
  static LocalStorageProvider instance = LocalStorageProvider._();

  LocalStorageProvider._();

  final GetStorage _local = GetStorage();

  String? get token {
    return _local.read<String?>(_token);
  }

  String? get devideID {
    return _local.read<String?>(_deviceId);
  }

  String get locale {
    return "ar";
  }
  String? get name {
    return _local.read<String?>(_name);
  }
  int? get userId {
    return _local.read<int?>(_userId) ?? 0;
  }
  bool? get isUserSkipOnBoarding {
    return _local.read<bool?>(_isUserSkipOnBoarding) ?? false;
  }
  String? get userName {
    return _local.read<String?>(_userName);
  }
  int? get userType {
    return _local.read<int?>(_userType);
  }
  bool get isFirstTime {
    return _local.read<bool>(_firstTime) ?? true;
  }
  static int get languageId {
    return GetStorage().read<int?>(_languageId) ?? 2;
  }
  bool? get isAuthenticate {
    return _local.read<bool?>(_isAuthed);
  }
  setFirstTime({bool value = false}) async {
    _local.write(_firstTime, value);
  }
  setIsAuth({bool value = false}) async {
    _local.write(_isAuthed, value);
  }
  static setLanguage(int languageId) async {
    await GetStorage().write(_languageId, languageId);
  }
  setIsIUserSkipOnBoarding({bool value = false}) async {
    _local.write(_isUserSkipOnBoarding, value);
  }
  setDeviceID(String? value) async {
    _local.write(_deviceId, value);
  }

  setToken(String? tokenx) async {
    await _local.write(_token, tokenx);
    if (tokenx == null) {
      await _local.write(_isAuthed, false);
    }
  }

  setUserId(int userId) async {
    await _local.write(_userId, userId);
  }

  setUserName(String name) async {await _local.write(_userName, name);}
  setUserType(int type) async {await _local.write(_userType, type);}
  static List<CountryModel>? getDataCountries() {
    final box = GetStorage();
    final jsonString = box.read(_listCountries);
    if (jsonString != null) {
      final encodedData = jsonDecode(jsonString);
      if (encodedData is List<dynamic>) {
        return encodedData
            .map((encoded) => CountryModel.fromJson(encoded))
            .toList();
      }
    }
    return null;
  }
  static void saveDataCountries(List<CountryModel> dataList) {
    final box = GetStorage();
    final encodedData = dataList.map((data) => data.toJson()).toList();
    box.write(_listCountries, jsonEncode(encodedData));
  }

}


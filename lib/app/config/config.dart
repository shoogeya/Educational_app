import 'package:flutter/foundation.dart';

class Config {
  static const bool liveMode = false;
  static const String baseUrlTest = 'https://apis.masarplatform.com/api/';
  static const String baseUrlLive = '';
  static const String baseUrl = liveMode == true ? baseUrlLive : baseUrlTest;
}

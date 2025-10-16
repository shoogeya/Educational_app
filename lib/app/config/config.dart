import 'package:flutter/foundation.dart';

class Config {
  static const bool liveMode = false;
  static const String baseUrlTest = '';
  static const String baseUrlLive = '';
  static const String baseUrl = liveMode == true ? baseUrlLive : baseUrlTest;
}

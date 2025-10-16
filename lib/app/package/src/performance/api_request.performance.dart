
import 'package:masar/app/package/src/performance/performance.report.dart';

class ApiRequestPerformance {
  Map<String?, PerformanceReport?> actionsReport = {};
  late DateTime _startTime;
  String? _actionName;
  String? _fullPath;

  static ApiRequestPerformance? _instance;

  static ApiRequestPerformance? get instance {
    _instance ??= ApiRequestPerformance();
    return _instance;
  }

  init(String? actionName, String fullPath) {
    _actionName = actionName;
    _fullPath = fullPath;
  }

  PerformanceReport? getReport() {
    if (!actionsReport.containsKey(_fullPath)) {
      actionsReport[_fullPath] = PerformanceReport(
          actionName: _actionName, fullPath: _fullPath);
    }
    return actionsReport[_fullPath];
  }

  startTrack() {
    _startTime = DateTime.now();
  }

  endTrack() {
    Duration? duration = DateTime.now().difference(_startTime);
    actionsReport[_fullPath] = PerformanceReport(
        actionName: _actionName,
        duration: duration,
        fullPath: _fullPath);
  }

  @override
  String toString() {
    String string = '';
    actionsReport.forEach((key, report) {
      string += '$report\n';
    });
    return string;
  }
}

import 'dart:io';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class ForegroundTaskManager {
  static void startService() {
    if (Platform.isAndroid) {
      FlutterForegroundTask.startService(
        notificationTitle: 'Downloading Video',
        notificationText: 'Your video is being downloaded...',
      );
    }
  }

  static void stopService() {
    if (Platform.isAndroid) {
      FlutterForegroundTask.stopService();
    }
  }
}

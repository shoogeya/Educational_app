import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationManager {
  static const int startNotificationId = 1;
  static const int progressNotificationId = 2;
  static const int completeNotificationId = 3;

  static void initialize() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showStartNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'start_channel',
      'Download Start',
      channelDescription: 'Notification when download starts',
      importance: Importance.high,
      priority: Priority.high,
      ongoing: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      startNotificationId,
      title,
      body,
      platformDetails,
    );
  }

  static Future<void> showProgressNotification(
      String title, int progress) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'progress_channel',
      'Download Progress',
      channelDescription: 'Notification channel for download progress',
      importance: Importance.low,
      priority: Priority.low,
      showProgress: true,
      maxProgress: 100,
      progress: progress,
      ongoing: true,
    );

    NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      progressNotificationId,
      title,
      'Progress: $progress%',
      platformDetails,
    );
  }

  static Future<void> showCompleteNotification(
      String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'complete_channel',
      'Download Complete',
      channelDescription: 'Notification when download completes',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    // إلغاء إشعار التقدم قبل إظهار الإشعار النهائي
    await flutterLocalNotificationsPlugin.cancel(progressNotificationId);

    await flutterLocalNotificationsPlugin.show(
      completeNotificationId,
      title,
      body,
      platformDetails,
    );
  }

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

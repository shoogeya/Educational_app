
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:masar/app/services/background_service.dart';
import 'package:masar/app/services/notification_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'app/routes/bindings/app_binding.dart';
import 'ebtikar.page.dart';
import 'package:firebase_core/firebase_core.dart';

final Logger logger = Logger();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppBinding.onRunApp();
  ForegroundTaskManager.startService();
  NotificationManager.initialize();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const EbtikarApp());
}


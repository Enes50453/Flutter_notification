import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationsSettings =
        new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelsSpecifics =
        new AndroidNotificationDetails(
            'you_can_name_it_whatever1', 'channel_name',
            playSound: true,
            //sound: RawResourceAndroidNotificationSound('notification'),
            importance: Importance.max,
            priority: Priority.high);
    var not = NotificationDetails(
      android: androidPlatformChannelsSpecifics,
    );
    await fln.show(0, title, body, not);
  }
}

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   static final _messaging = FirebaseMessaging.instance;
//
//   static Future<void> init() async {
//     // Permission
//     await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     // iOS foreground show
//     await _messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     // Android channel
//     const channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.high,
//     );
//     await FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation
//     AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     // FCM Token
//     final token = await getToken();
//     debugPrint('FCM Token: $token');
//
//     // Foreground message
//     FirebaseMessaging.onMessage.listen((message) {
//       _showLocalNotification(message);
//     });
//
//     // Background tap
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       _handleNavigation(message);
//     });
//
//     // Token refresh
//     _messaging.onTokenRefresh.listen((newToken) {
//       _sendTokenToServer(newToken);
//     });
//   }
//
//   static Future<String?> getToken() async {
//     return await _messaging.getToken();
//   }
//
//   static Future<void> _sendTokenToServer(String token) async {
//     // Backend API call করো token পাঠাতে
//     // await ApiService.updateFcmToken(token);
//   }
//
//   static void _showLocalNotification(RemoteMessage message) {
//     final notification = message.notification;
//     if (notification == null) return;
//
//     FlutterLocalNotificationsPlugin().show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'high_importance_channel',
//           'High Importance Notifications',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ), id: null,
//     );
//   }
//
//   static void _handleNavigation(RemoteMessage message) {
//     final data = message.data;
//     // data['type'] দিয়ে navigate করো
//     // e.g. if (data['type'] == 'appointment') Get.toNamed(Routes.appointment);
//   }
// }
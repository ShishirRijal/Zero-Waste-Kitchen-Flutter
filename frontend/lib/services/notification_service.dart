import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationMessage {
  final String title;
  final String body;
  PushNotificationMessage({
    required this.title,
    required this.body,
  });
}

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);

  Future<void> initialise() async {
    if (Platform.isIOS) {
      NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print("Notification permission granted");
      } else {
        print("Notification permission denied");
      }
    }

    // If you want to test the push notification locally,
    // you need to get the token and input it to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    try {
      // String? token = await _fcm.getToken();
      // print("FirebaseMessaging token: $token");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("onMessage: $message");
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("onResume: $message");
      });

      FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
        print("onLaunch (background): $message");
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

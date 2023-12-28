import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future intt() async {
    await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    final token = await messaging.getToken();
    print("Device token :$token");
  }

  Future whenNotififcationRecived(BuildContext context) async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppshowNotificationData(remoteMessage.data["userID"],
            remoteMessage.data["SenderID"], context);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppshowNotificationData(remoteMessage.data["userID"],
            remoteMessage.data["SenderID"], context);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppshowNotificationData(remoteMessage.data["userID"],
            remoteMessage.data["SenderID"], context);
      }
    });
  }

  openAppshowNotificationData(receiverID, senderID, context) async {}
}

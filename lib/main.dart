import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dating_app/controllers/auth/authentication_controller.dart.dart';
import 'package:dating_app/pushNotficationSystem/push_notification_system.dart';
import 'package:dating_app/views/utils/image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'views/authentication/login/login_screen.dart';

// Future _firebaseBackgroundMESSAGE(RemoteMessage message) async {
//   if (message.notification != null) {
//     print("Some notification recevied");
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'Basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for sending alerts',
  //       defaultColor: Colors.pink,
  //       importance: NotificationImportance.Max,
  //       defaultPrivacy: NotificationPrivacy.Public,
  //       defaultRingtoneType: DefaultRingtoneType.Notification,
  //       enableVibration: true,
  //       channelShowBadge: true,
  //       enableLights: true,
  //       ledColor: Colors.white,
  //     ),
  //   ],
  //   debug: true,
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationController());
  });
  // PushNotificationSystem().intt();
  // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMESSAGE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(useMaterial3: true, scaffoldBackgroundColor: Colors.black),
      home: const LoginScreen(),
    );
  }
}

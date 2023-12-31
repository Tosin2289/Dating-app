// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCpEhv3SuaVZvB3BKA6EtxRx-7Fke_kEk0',
    appId: '1:1083911831063:web:8cf7bac08a0a67fb822652',
    messagingSenderId: '1083911831063',
    projectId: 'datingapp-41138',
    authDomain: 'datingapp-41138.firebaseapp.com',
    storageBucket: 'datingapp-41138.appspot.com',
    measurementId: 'G-2G25FT047N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrFWU_6v6M7wyAzTlbcPzyOwZGxuwMIpk',
    appId: '1:1083911831063:android:feaad9f07aaa0382822652',
    messagingSenderId: '1083911831063',
    projectId: 'datingapp-41138',
    storageBucket: 'datingapp-41138.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGbORoFvB64U-V6-rNyY_pCEioL4DeCXE',
    appId: '1:1083911831063:ios:8627b48522f6c636822652',
    messagingSenderId: '1083911831063',
    projectId: 'datingapp-41138',
    storageBucket: 'datingapp-41138.appspot.com',
    iosBundleId: 'com.example.datingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGbORoFvB64U-V6-rNyY_pCEioL4DeCXE',
    appId: '1:1083911831063:ios:8627b48522f6c636822652',
    messagingSenderId: '1083911831063',
    projectId: 'datingapp-41138',
    storageBucket: 'datingapp-41138.appspot.com',
    iosBundleId: 'com.example.datingApp',
  );
}

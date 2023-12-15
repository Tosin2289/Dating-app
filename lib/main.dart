import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/authentication/login/login_screen.dart';

void main() {
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

import 'package:ai_generate/config/approute.dart';
import 'package:ai_generate/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/authscreen/login_screen.dart';
import 'view/bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(name: AppRoute.bottomScreen, page: () => BottomScreen()),
        GetPage(name: AppRoute.loginScreen, page: () => LoginScreen()),
      ],
    );
  }
}

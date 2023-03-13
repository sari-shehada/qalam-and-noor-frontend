import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/login_page/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      themeMode: ThemeMode.light,
      theme: ProjectThemes.lightTheme,
      darkTheme: ProjectThemes.darkTheme,
      home: const LoginPage(),
    );
  }
}
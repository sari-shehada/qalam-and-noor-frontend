import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/loader/controllers/loader_bindings.dart';
import 'package:kalam_noor/pages/loader/views/loader.dart';

void main() {
  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //TODO: Remove Later
      // routes: {
      //   'HomePage': (context) => const HomePage(),
      // },
      debugShowCheckedModeBanner: false,
      initialBinding: LoaderBindings(),
      locale: const Locale('ar'),
      themeMode: ThemeMode.light,
      theme: ProjectThemes.lightTheme,
      darkTheme: ProjectThemes.darkTheme,
      home: const LoaderPage(),
    );
  }
}


//TODO: Add custom text fields and use them in:
//1. LoginPage
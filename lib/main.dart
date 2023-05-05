import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'configs/http_overrides.dart';
import 'pages/loader/views/loader.dart';

import 'configs/project_themes.dart';
import 'models/shared_prefs_helper.dart';
import 'pages/loader/controllers/loader_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = HttpCertificateOverrides();
  await SharedPrefsHelper.init();
  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        1920,
        1080,
      ),
      useInheritedMediaQuery: true,
      // child: const TestPage(),
      child: const LoaderPage(),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Qalam & Noor',
          debugShowCheckedModeBanner: false,
          initialBinding: LoaderBindings(),
          locale: const Locale('ar'),
          themeMode: ThemeMode.light,
          theme: ProjectThemes.lightTheme,
          darkTheme: ProjectThemes.darkTheme,
          home: child,
          // initialRoute: '/',
        );
      },
    );
  }
}


//TODO:
//1. Change transition between pages to fade
//2. Move add new student (register student) to Manage Students Tab
//3. Fill up the empty container in dashboard page
//4. Add new employee registration page
//5. Add Exams Management to Classes
//6. Refactor upper panel size in Dashboard page
//7. Add Psychological Instructor Page (with a button to fill missing students psy statuses)
//8. Enable Search by name for employees in EmployeesManagementPage
//9. Use Tabbar in medicals management page to fill up the space
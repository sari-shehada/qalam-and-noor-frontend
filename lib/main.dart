import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'configs/project_themes.dart';
import 'models/shared_prefs_helper.dart';
import 'pages/shared/loader/controllers/loader_bindings.dart';
import 'pages/shared/loader/views/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = HttpCertificateOverrides();
  await SharedPrefsHelper.init();
  // await SharedPrefsHelper.instance.clearAll();
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
//3. Fill up the empty containers in dashboard page
//5. Add Exams Management to Classes
//8. Enable Search by name for employees in EmployeesManagementPage

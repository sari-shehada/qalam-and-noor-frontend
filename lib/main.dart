import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'configs/project_themes.dart';
import 'models/shared_prefs_helper.dart';
import 'pages/loader/controllers/loader_bindings.dart';
import 'pages/loader/views/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: const LoaderPage(),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: LoaderBindings(),
          locale: const Locale('ar'),
          themeMode: ThemeMode.light,
          theme: ProjectThemes.lightTheme,
          darkTheme: ProjectThemes.darkTheme,
          home: child,
        );
      },
    );
  }
}

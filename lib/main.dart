// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kalam_noor/models/agendas/student.dart';
import 'package:kalam_noor/models/educational/year_record.dart';

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

class NewStudentRegistrationModel {
  final Student student;
  final YearRecord yearRecord;
  NewStudentRegistrationModel({
    required this.student,
    required this.yearRecord,
  });

  NewStudentRegistrationModel copyWith({
    Student? student,
    YearRecord? yearRecord,
  }) {
    return NewStudentRegistrationModel(
      student: student ?? this.student,
      yearRecord: yearRecord ?? this.yearRecord,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'student': student.toMap(),
      'yearRecord': yearRecord.toMap(),
    };
  }

  factory NewStudentRegistrationModel.fromMap(Map<String, dynamic> map) {
    return NewStudentRegistrationModel(
      student: Student.fromMap(map['student'] as Map<String, dynamic>),
      yearRecord: YearRecord.fromMap(map['yearRecord'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewStudentRegistrationModel.fromJson(String source) =>
      NewStudentRegistrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewStudentRegistrationModel(student: $student, yearRecord: $yearRecord)';

  @override
  bool operator ==(covariant NewStudentRegistrationModel other) {
    if (identical(this, other)) return true;

    return other.student == student && other.yearRecord == yearRecord;
  }

  @override
  int get hashCode => student.hashCode ^ yearRecord.hashCode;
}

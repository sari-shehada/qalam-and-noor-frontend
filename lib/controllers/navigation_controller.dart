import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/employee.dart';
import 'package:kalam_noor/pages/add_new_student/views/add_new_student_page.dart';
import 'package:kalam_noor/pages/courses_management/views/courses_management_page.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_bindings.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';
import 'package:kalam_noor/pages/dashboard/views/dashboard.dart';
import 'package:kalam_noor/pages/login_page/views/login_page.dart';
import 'package:kalam_noor/pages/general_record_management/views/general_record_management_page.dart';
import 'package:kalam_noor/pages/medicals_management/views/medicals_management_page.dart';

import '../pages/login_page/controllers/login_page_bindings.dart';

class NavigationController {
  static void toLoginPage() {
    Get.offAll(() => const LoginPage(),
        binding: LoginPageBindings(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800));
  }

  static void toDashboard(Employee employee) {
    Get.offAll(() => const Dashboard(),
        binding: DashboardBindings(
          employee: employee,
          dashboardDestinations: [
            DashboardDestinationCard(
              title: 'إضافة طالب جديد',
              iconData: FontAwesomeIcons.userPlus,
              description: '',
              destination: const AddNewStudentPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة السجل العام',
              iconData: FontAwesomeIcons.peopleGroup,
              description: '',
              destination: const GeneralRecordManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة المواد',
              iconData: FontAwesomeIcons.book,
              description: '',
              destination: const CoursesManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة الشعب',
              iconData: FontAwesomeIcons.school,
              description: '',
              destination: const Scaffold(),
            ),
            DashboardDestinationCard(
              title: 'إدارة الشؤون الصحية',
              iconData: FontAwesomeIcons.syringe,
              description: '',
              destination: const MedicalsManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة العناوين',
              iconData: FontAwesomeIcons.mapLocationDot,
              description: '',
              destination: const Scaffold(),
            ),
          ],
        ));
  }
}

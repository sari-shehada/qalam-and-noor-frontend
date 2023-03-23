import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/addresses_managment/views/addresses_managment_page.dart';
import '../models/agendas/employee.dart';
import '../pages/dashboard/views/dashboard_page.dart';
import '../pages/add_new_student/views/add_new_student_page.dart';
import '../pages/courses_management/views/courses_management_page.dart';
import '../pages/navigation_page/controllers/navigation_bindings.dart';
import '../pages/dashboard/models/dashboard_destination_card.dart';
import '../pages/navigation_page/views/navigation_page.dart';
import '../pages/login_page/views/login_page.dart';
import '../pages/general_record_management/views/general_record_management_page.dart';
import '../pages/medicals_management/views/medicals_management_page.dart';

import '../pages/login_page/controllers/login_page_bindings.dart';
import '../pages/settings/views/settings_page.dart';

class NavigationController {
  static void toLoginPage() {
    Get.offAll(() => const LoginPage(),
        binding: LoginPageBindings(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800));
  }

  static void toDashboard(Employee employee) {
    Get.offAll(() => const NavigationPage(),
        binding: NavigationBindings(
          employee: employee,
          dashboardDestinations: [
            DashboardDestinationCard(
              title: 'لوحة التحكم',
              iconData: FontAwesomeIcons.house,
              destination: const DashboardPage(),
            ),
            DashboardDestinationCard(
              title: 'إضافة طالب جديد',
              iconData: FontAwesomeIcons.userPlus,
              destination: const AddNewStudentPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة السجل العام',
              iconData: FontAwesomeIcons.peopleGroup,
              destination: const GeneralRecordManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة المواد',
              iconData: FontAwesomeIcons.book,
              destination: const CoursesManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة الشعب',
              iconData: FontAwesomeIcons.school,
              destination: const Scaffold(),
            ),
            DashboardDestinationCard(
              title: 'إدارة الشؤون الصحية',
              iconData: FontAwesomeIcons.syringe,
              destination: const MedicalsManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'إدارة العناوين',
              iconData: FontAwesomeIcons.mapLocationDot,
              destination: const AddressesManagementPage(),
            ),
            DashboardDestinationCard(
              title: 'الملف الشخصي',
              iconData: FontAwesomeIcons.gear,
              destination: const SettingsPage(),
            ),
          ],
        ));
  }
}

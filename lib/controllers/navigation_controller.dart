import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/views/school_inbox_page.dart';
import 'package:kalam_noor/pages/vaccines_management_page/views/vaccines_management_page.dart';
import '../pages/addresses_management/main_page/views/addresses_management_page.dart';
import '../pages/school_classes_management/views/school_classes_management_page.dart';
import '../pages/school_year_management/views/school_year_management_page.dart';
import '../models/agendas/employee.dart';
import '../pages/dashboard/views/dashboard_page.dart';
import '../pages/new_student_registration/student_information/views/new_student_registration_page.dart';

import '../pages/navigation_page/controllers/navigation_bindings.dart';
import '../pages/dashboard/models/navigation_rail_destination_card.dart';
import '../pages/navigation_page/views/navigation_page.dart';
import '../pages/login_page/views/login_page.dart';
import '../pages/medicals_management/views/medicals_management_page.dart';

import '../pages/login_page/controllers/login_page_bindings.dart';
import '../pages/vaccines_management_page/controllers/vaccines_management_controller.dart';

class NavigationController {
  static void toLoginPage() {
    Get.offAll(() => const LoginPage(),
        binding: LoginPageBindings(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800));
  }

  static void toDashboard(Employee employee) {
    Get.offAll(
      () => const NavigationPage(),
      binding: NavigationBindings(
        employee: employee,
        railDestinations: [
          NavigationRailDestinationCard(
            title: 'لوحة التحكم',
            iconData: FontAwesomeIcons.house,
            destination: const DashboardPage(),
          ),
          NavigationRailDestinationCard(
            title: 'تسحيل طالب جديد',
            iconData: FontAwesomeIcons.userPlus,
            destination: const NewStudentRegistrationPage(),
          ),
          NavigationRailDestinationCard(
            title: 'إدارة العام الدراسي',
            iconData: FontAwesomeIcons.school,
            destination: const SchoolYearManagementPage(),
          ),
          NavigationRailDestinationCard(
            title: 'إدارة المراحل الدراسية',
            iconData: FontAwesomeIcons.book,
            destination: const SchoolClassesManagementPage(),
          ),
          NavigationRailDestinationCard(
            title: 'إدارة الشعب',
            iconData: FontAwesomeIcons.school,
            destination: const Scaffold(),
          ),
          NavigationRailDestinationCard(
            title: 'إدارة الشؤون الصحية',
            iconData: FontAwesomeIcons.syringe,
            destination: const MedicalsManagementPage(),
          ),
          NavigationRailDestinationCard(
            title: 'إدارة العناوين',
            iconData: FontAwesomeIcons.mapLocationDot,
            destination: const AddressesManagementPage(),
          ),
          NavigationRailDestinationCard(
            title: 'بريد المدرسة',
            iconData: FontAwesomeIcons.inbox,
            destination: const SchoolInboxPage(),
          ),
        ],
      ),
    );
  }

  static void toVaccinesManagementPage() {
    Get.to(
      () => const VaccinesManagementPage(),
      binding: BindingsBuilder.put(
        () => VaccinesManagementController(),
      ),
    );
  }

  static void toIllnessesManagementPage() {
    //TODO:
    Get.to(
      () => const VaccinesManagementPage(),
      binding: BindingsBuilder.put(
        () => VaccinesManagementController(),
      ),
    );
  }

  static void toPsychologicalStatusesManagementPage() {
    //TODO:
    Get.to(
      () => const VaccinesManagementPage(),
      binding: BindingsBuilder.put(
        () => VaccinesManagementController(),
      ),
    );
  }
}

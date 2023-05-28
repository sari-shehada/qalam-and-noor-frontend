import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/controllers/account_controller.dart';
import 'package:kalam_noor/pages/navigation_page/controllers/navigation_bindings.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/dashboard/views/psychological_instructor_dashboard.dart';
import '../../pages/addresses_management/main_page/views/addresses_management_page.dart';
import '../../pages/dashboard/models/navigation_rail_destination_card.dart';
import '../../pages/dashboard/views/dashboard_page.dart';
import '../../pages/employees_management_page/main_page/views/employees_management_page.dart';
import '../../pages/medicals_management/views/medicals_management_page.dart';
import '../../pages/psychological_instructor_pages/student_fill_psychological_statuses_page/main_page/views/student_fill_psychological_statuses_page.dart';
import '../../pages/public_record_page/views/public_record_page.dart';
import '../../pages/school_classes_management_page/main_page/views/school_classes_management_page.dart';
import '../../pages/school_inbox_page/main_page/views/school_inbox_page.dart';
import '../../pages/school_year_management/views/school_year_management_page.dart';
import '../../pages/statistics_page/views/stats_page.dart';
import '../../pages/student_display_page/views/students_management_page.dart';

abstract class DestinationsHelper {
  static Map<UserRole, NavigationBindings> routes = {
    UserRole.secretary: NavigationBindings(
      railDestinations: secretaryDestinations,
      hasBottomSection: true,
      hasMiddleSection: true,
    ),
    UserRole.psychologicalInstructor: NavigationBindings(
      railDestinations: psychologicalInstructorDestinations,
      hasBottomSection: false,
      hasMiddleSection: true,
    ),
    UserRole.teacher: NavigationBindings(
      railDestinations: teacherDestinations,
      hasBottomSection: false,
      hasMiddleSection: false,
    ),
    UserRole.other: NavigationBindings(
      railDestinations: otherDestinations,
      hasBottomSection: false,
      hasMiddleSection: false,
    ),
  };

  static List<NavigationRailDestinationCard> secretaryDestinations = [
    NavigationRailDestinationCard(
      title: 'لوحة التحكم',
      iconData: FontAwesomeIcons.house,
      destination: const DashboardPage(),
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
      title: 'إدارة شؤون الطلاب',
      iconData: FontAwesomeIcons.graduationCap,
      destination: const StudentsManagementPage(),
    ),
    NavigationRailDestinationCard(
      title: 'إدارة شؤون الموظفين',
      iconData: FontAwesomeIcons.userTie,
      destination: const EmployeesManagementPage(),
    ),
    NavigationRailDestinationCard(
      title: 'السجل العام',
      iconData: FontAwesomeIcons.sheetPlastic,
      destination: const PublicRecordPage(),
    ),
    NavigationRailDestinationCard(
      title: 'إحصائيات',
      iconData: FontAwesomeIcons.chartPie,
      destination: const StatsPage(),
    ),
    NavigationRailDestinationCard(
      title: 'بريد المدرسة',
      iconData: FontAwesomeIcons.inbox,
      destination: const SchoolInboxPage(),
    ),
  ];

  static List<NavigationRailDestinationCard>
      psychologicalInstructorDestinations = [
    NavigationRailDestinationCard(
      title: 'لوحة التحكم',
      iconData: FontAwesomeIcons.house,
      destination: const PsychologicalInstructorDashboard(),
    ),
    NavigationRailDestinationCard(
      title: 'حالات الطلاب الجدد',
      iconData: FontAwesomeIcons.graduationCap,
      destination: const StudentFillPsychologicalStatusesPage(),
    ),
  ];

  static List<NavigationRailDestinationCard> teacherDestinations = [
    NavigationRailDestinationCard(
      title: 'لوحة التحكم',
      iconData: FontAwesomeIcons.house,
      destination: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.find<AccountController>().logout();
            },
            child: const Text('logout'),
          ),
        ),
      ),
    ),
  ];

  static List<NavigationRailDestinationCard> otherDestinations = [
    NavigationRailDestinationCard(
      title: 'لوحة التحكم',
      iconData: FontAwesomeIcons.house,
      destination: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('Not Supported'),
              ElevatedButton(
                onPressed: () {
                  Get.find<AccountController>().logout();
                },
                child: const Text('logout'),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  static NavigationBindings getDestinations(String jobTitle) {
    switch (jobTitle) {
      case 'أمين سر':
        {
          return routes[UserRole.secretary]!;
        }
      case 'مدرس':
        {
          return routes[UserRole.teacher]!;
        }
      case 'مرشد نفسي':
        {
          return routes[UserRole.psychologicalInstructor]!;
        }
      default:
        {
          return routes[UserRole.other]!;
        }
    }
  }
}

enum UserRole { secretary, psychologicalInstructor, teacher, other }

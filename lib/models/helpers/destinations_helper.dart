import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/pages/other/main_page/views/not_yet_supported_page.dart';
import 'package:kalam_noor/pages/shared/navigation_page/controllers/navigation_bindings.dart';
import 'package:kalam_noor/pages/psychological_instructor/dashboard_page/views/psychological_instructor_dashboard.dart';
import 'package:kalam_noor/pages/teacher/dashboard_page/views/teacher_dashboard_page.dart';
import '../../pages/secretary/addresses_management_page/main_page/views/addresses_management_page.dart';
import '../../pages/shared/navigation_page/models/navigation_rail_destination_card.dart';
import '../../pages/secretary/dashboard_page/views/secretary_dashboard_page.dart';
import '../../pages/secretary/employees_management_page/main_page/views/employees_management_page.dart';
import '../../pages/secretary/medicals_management_page/main_page/views/medicals_management_page.dart';
import '../../pages/psychological_instructor/student_fill_psychological_statuses_page/main_page/views/student_fill_psychological_statuses_page.dart';
import '../../pages/secretary/public_record_page/views/public_record_page.dart';
import '../../pages/secretary/school_classes_management_page/main_page/views/school_classes_management_page.dart';
import '../../pages/secretary/school_inbox_page/main_page/views/school_inbox_page.dart';
import '../../pages/secretary/school_year_management/views/school_year_management_page.dart';
import '../../pages/secretary/statistics_page/views/stats_page.dart';
import '../../pages/secretary/students_management_page/main_page/views/students_management_page.dart';

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
      title: 'الرئيسية',
      iconData: FontAwesomeIcons.house,
      destination: const SecretaryDashboardPage(),
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
      title: 'الرئيسية',
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
      title: 'الرئيسية',
      iconData: FontAwesomeIcons.house,
      destination: const TeacherDashboardPage(),
    ),
  ];

  static List<NavigationRailDestinationCard> otherDestinations = [
    NavigationRailDestinationCard(
      title: 'الرئيسية',
      iconData: FontAwesomeIcons.house,
      destination: const NotYetSupportedPage(),
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

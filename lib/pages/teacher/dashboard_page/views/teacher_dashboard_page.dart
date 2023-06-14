import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/widgets/employee_dashboard_profile_widget.dart';
import '../controllers/teacher_dashboard_controller.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherDashboardControllerController controller = Get.put(
      TeacherDashboardControllerController(),
    );
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'الرئيسية',
        iconData: FontAwesomeIcons.house,
        actionButton: EmployeeDashboardProfileWidget(),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'صفحة المدرس',
              style: ProjectFonts.headlineMedium(),
            ),
          ],
        ),
      ),
    );
  }
}

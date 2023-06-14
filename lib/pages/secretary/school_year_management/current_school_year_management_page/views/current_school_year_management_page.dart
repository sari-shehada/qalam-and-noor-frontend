import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/controllers/current_school_year_management_controller.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';

class CurrentSchoolYearManagementPage
    extends GetView<CurrentSchoolYearManagementController> {
  const CurrentSchoolYearManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'العام الدراسي : ${controller.schoolYear.name}',
        iconData: FontAwesomeIcons.school,
        backButtonEnabled: true,
      ),
    );
  }
}

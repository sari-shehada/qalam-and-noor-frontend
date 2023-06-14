import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/psychological_instructor/student_fill_psychological_statuses_page/assign_student_psychological_info_page/controllers/assign_student_psychological_info_controller.dart';
import 'package:kalam_noor/pages/psychological_instructor/student_fill_psychological_statuses_page/assign_student_psychological_info_page/views/widgets/student_psychological_status_list.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

class AssignStudentPsychologicalInfoPage
    extends GetView<AssignStudentPsychologicalInfoController> {
  const AssignStudentPsychologicalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    String studentWord = 'للطالب';
    if (!controller.student.isMale) {
      studentWord += 'ة';
    }
    return CustomScaffold(
      appBar: CustomAppBar(
        title:
            'تعيين الحالات الاجتماعية $studentWord ${controller.student.firstName}',
        iconData: FontAwesomeIcons.faceMeh,
        backButtonEnabled: true,
        actionButton: CustomAppBarActionButton(
            label: 'اضافة الحالات الاجتماعية للطالب',
            onTap: () => controller.addPsychologicalStatuses(),
            buttonStatus: controller.buttonStatus),
      ),
      body: SizedBox.expand(
        child: Obx(
          () {
            switch (controller.loadingStatus.value) {
              case PsychologicalStatusesLoadingStatus.hasData:
                {
                  return const StudentPsychologicalStatusList();
                }
              case PsychologicalStatusesLoadingStatus.hasError:
                {
                  return const ErrorLoadingSomethingWidget(
                    somethingName: 'الحالات النفسية',
                  );
                }
              case PsychologicalStatusesLoadingStatus.isLoading:
                {
                  return const Center(
                    child: LoaderWidget(),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

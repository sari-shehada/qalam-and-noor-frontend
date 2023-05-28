import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/psychological_instructor_pages/student_fill_psychological_statuses_page/assign_student_psychological_info_page/controllers/assign_student_psychological_info_controller.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

class AssignStudentPsychologicalInfoPage
    extends GetView<AssignStudentPsychologicalInfoController> {
  const AssignStudentPsychologicalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox.expand(
        child: Obx(
          () {
            switch (controller.loadingStatus.value) {
              case PsychologicalStatusesLoadingStatus.hasData:
                {
                  ListView.builder(
                    itemCount: controller.psychologicalStatuses.length,
                    itemBuilder: (context, index) {
                      return Text(controller.psychologicalStatuses[index].name);
                    },
                  );
                }
              case PsychologicalStatusesLoadingStatus.hasError:
                {
                  const ErrorLoadingSomethingWidget(
                      somethingName: 'الحالات النفسية');
                }
              case PsychologicalStatusesLoadingStatus.isLoading:
                {
                  return const Center(
                    child: LoaderWidget(),
                  );
                }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

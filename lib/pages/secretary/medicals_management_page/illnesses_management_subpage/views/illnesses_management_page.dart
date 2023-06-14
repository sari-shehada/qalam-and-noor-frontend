import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/pages/secretary/medicals_management_page/illnesses_management_subpage/views/widgets/illnesses_table.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../tools/widgets/empty_item_widget.dart';
import '../controllers/illness_management_controller.dart';

class IllnessesManagementPage extends StatelessWidget {
  const IllnessesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    IllnessesManagementController illnessesManagementController = Get.find();
    return Column(
      children: [
        Expanded(
          flex: 70,
          child: LabeledWidget(
            label: 'الأمراض الحالية',
            labelTextStyle: TextStyle(
              fontSize: 30.sp,
            ),
            spacing: 35.h,
            child: Expanded(
              child: Obx(() {
                return FutureBuilder<RxList<Illness>>(
                  future: illnessesManagementController.illnesses.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LoaderWidget(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const ErrorLoadingSomethingWidget(
                        somethingName: 'أمراض',
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return ErrorLoadingSomethingWidget(
                          somethingName: 'أمراض',
                          retryCallback: () =>
                              illnessesManagementController.refreshIllnesses(),
                        );
                      } else {
                        RxList<Illness> illness =
                            snapshot.data as RxList<Illness>;
                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: 600.milliseconds,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: IllnessesTable(illnesses: illness),
                            );
                          },
                        );
                      }
                    } else {
                      return const EmptyItemWidget(
                        itemName: 'أمراض',
                        iconData: FontAwesomeIcons.virus,
                      );
                    }
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

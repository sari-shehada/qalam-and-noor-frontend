import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../secretary/dashboard_page/views/widgets/useful_links_list_widget.dart';
import '../../controller/psychological_instructor_dashboard_controller.dart';
import '../psychological_instructor_dashboard.dart';

class PsychologicalInstructorUsefulLinksListWidget
    extends GetView<PsychologicalInstructorDashboardController> {
  const PsychologicalInstructorUsefulLinksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'روابط مفيدة',
          style: ProjectFonts.headlineMedium(),
        ),
        AddVerticalSpacing(value: 15.h),
        Expanded(
          child: Obx(
            () {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
                child: ListView.separated(
                  itemCount: controller.usefulLinks.length,
                  padding: EdgeInsets.only(bottom: 25.h, top: 20.h),
                  itemBuilder: (context, index) {
                    return DashboardContainer2(
                      padding: EdgeInsets.only(bottom: 25.h, top: 20.h),
                      buildChildWithContainer: true,
                      child: controller.usefulLinks.isEmpty
                          ? null
                          : UsefulLinkWidget(
                              link: controller.usefulLinks[index],
                            ),
                    );
                  },
                  separatorBuilder: (context, index) => AddVerticalSpacing(
                    value: 20.h,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

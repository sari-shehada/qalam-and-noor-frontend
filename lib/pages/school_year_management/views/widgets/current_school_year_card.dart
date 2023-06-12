import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_year.dart';

import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/widgets/empty_item_widget.dart';
import '../../../../tools/widgets/error_loading_something_widget.dart';
import '../../controllers/school_year_management_controller.dart';

class CurrentSchoolYearCard extends StatelessWidget {
  const CurrentSchoolYearCard({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolYearManagementController controller = Get.find();
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Obx(() {
        return FutureBuilder<SchoolYear>(
          future: controller.currentSchoolYear.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'العام الدراسي الحالي',
                retryCallback: () => controller.refreshCurrentSchoolYear(),
              );
            }
            if (snapshot.hasData) {
              return Expanded(
                child: CurrentSchoolYearCardData(
                  schoolYear: snapshot.data!,
                ),
              );
            } else {
              return const EmptyItemWidget(
                itemName: 'عام دراسي حالي',
                iconData: FontAwesomeIcons.school,
              );
            }
          },
        );
      }),
    );
  }
}

class CurrentSchoolYearCardData extends StatelessWidget {
  const CurrentSchoolYearCardData({
    super.key,
    required this.schoolYear,
  });

  final SchoolYear schoolYear;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(schoolYear.name),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import 'package:kalam_noor/pages/new_student_registration/medical_information/controllers/widget_controllers/student_vaccines_info_sub_widget_controller.dart';
import 'package:kalam_noor/tools/logic_tools/datetime_helper.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../../../../configs/fonts.dart';
import '../../../../../configs/styles.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class StudentVaccinesInfoSubWidget extends StatelessWidget {
  const StudentVaccinesInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentVaccinesInfoSubWidgetController controller =
        Get.put(StudentVaccinesInfoSubWidgetController());
    return Obx(
      () => FutureBuilder(
        future: controller.vaccines.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoaderWidget());
          } else {
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'لقاحات',
                retryCallback: () => controller.getVaccines(),
              );
            }
            if (snapshot.hasData) {
              if ((snapshot.data as List).isEmpty) {
                //TODO:
                return const EmptyItemWidget(
                    itemName: 'لقاحات', iconData: FontAwesomeIcons.syringe);
              }
              List<Vaccine> vaccines = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'قم باختيار اللقاحات التي لدى الطالب من القائمة ادناه',
                    style: ProjectFonts.titleMedium(),
                  ),
                  AddVerticalSpacing(value: 25.h),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: vaccines.length,
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, bottom: 220.h),
                          itemBuilder: (context, index) {
                            final Vaccine vaccine = vaccines[index];
                            return Obx(
                              () => Material(
                                color: controller.selectedVaccines
                                        .contains(vaccine)
                                    //TODO: Consider changing this color later
                                    ? Get.theme.colorScheme.surfaceVariant
                                        .withOpacity(.5)
                                    : Colors.transparent,
                                child: InkWell(
                                  onTap: () =>
                                      controller.selectVaccine(vaccine),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          vaccine.name,
                                          style: ProjectFonts.bodyLarge(),
                                        ),
                                        if (controller.selectedVaccines
                                            .contains(vaccine))
                                          Column(
                                            children: [
                                              const Text('تاريخ الجرعة'),
                                              AddVerticalSpacing(value: 5.h),
                                              Text(
                                                DateTimeHelper
                                                    .getDateWithoutTime(
                                                        controller
                                                                .takenVaccines[
                                                            vaccine]!),
                                              )
                                            ],
                                          ),
                                        Checkbox(
                                          value: controller.selectedVaccines
                                              .contains(vaccine),
                                          onChanged: (value) =>
                                              controller.selectVaccine(vaccine),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 0.h,
                              color: Get.theme.colorScheme.surfaceVariant,
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 25.h),
                            height: 220.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'تم اختيار: ',
                                      style: ProjectFonts.titleMedium(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        color: Get
                                            .theme.colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(
                                            GlobalStyles.globalBorderRadius),
                                      ),
                                      child: Obx(
                                        () => Text(
                                          '${controller.selectedVaccines.length} لقاح',
                                          style: ProjectFonts.titleMedium()
                                              .copyWith(
                                            color:
                                                Get.theme.colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                AddVerticalSpacing(value: 20.h),
                                CustomFilledButton(
                                  height: 50.h,
                                  onTap: () => controller.addNewVaccine(),
                                  child: 'إضافة لقاح جديد',
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

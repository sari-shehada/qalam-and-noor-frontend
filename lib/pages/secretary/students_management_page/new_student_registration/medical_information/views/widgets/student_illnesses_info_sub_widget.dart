import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../models/medical/illness.dart';
import '../../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../../../tools/widgets/error_loading_something_widget.dart';

import '../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../controllers/widget_controllers/student_illnesses_info_sub_widget_controller.dart';

class StudentIllnessesInfoSubWidget extends StatelessWidget {
  const StudentIllnessesInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentIllnessesInfoSubWidgetController controller =
        Get.put(StudentIllnessesInfoSubWidgetController());
    return Obx(
      () => FutureBuilder(
        future: controller.illnesses.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoaderWidget());
          } else {
            if (snapshot.hasError) {
              return Column(
                children: [
                  const ErrorLoadingSomethingWidget(
                    somethingName: "الأمراض",
                  ),
                  CustomFilledButton(
                    onTap: () => controller.getIllnesses(),
                    child: 'إعادة المحاولة',
                  ),
                ],
              );
            }
            if (snapshot.hasData) {
              if ((snapshot.data as List).isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'أمراض',
                  iconData: FontAwesomeIcons.virus,
                );
              }
              List<Illness> illnesses = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'قم باختيار الأمراض التي لدى الطالب من القائمة ادناه',
                    style: ProjectFonts.titleMedium(),
                  ),
                  AddVerticalSpacing(value: 25.h),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: illnesses.length,
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, bottom: 220.h),
                          itemBuilder: (context, index) {
                            final Illness illness = illnesses[index];
                            return Obx(
                              () => Material(
                                color: controller.selectedIllnesses
                                        .contains(illness)
                                    //TODO: Consider changing this color later
                                    ? Get.theme.colorScheme.surfaceVariant
                                        .withOpacity(.5)
                                    : Colors.transparent,
                                child: InkWell(
                                  onTap: () =>
                                      controller.selectIllness(illness),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          illness.name,
                                          style: ProjectFonts.bodyLarge(),
                                        ),
                                        Checkbox(
                                          value: controller.selectedIllnesses
                                              .contains(illness),
                                          onChanged: (value) =>
                                              controller.selectIllness(illness),
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
                                          '${controller.selectedIllnesses.length} مرض',
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
                                  onTap: () => controller.addNewIllness(),
                                  child: 'إضافة مرض جديد',
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

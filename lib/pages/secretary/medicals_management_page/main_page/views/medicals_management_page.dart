import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../illnesses_management_subpage/views/illnesses_management_page.dart';
import 'widgets/medicals_management_tabbar_item.dart';
import '../../psychological_statuses_management_subpage/views/psychological_statuses_management_page.dart';
import '../../vaccines_management_subpage/views/vaccines_management_page.dart';
import '../../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

import '../../../../../tools/ui_tools/buttons.dart';
import '../controllers/medicals_management_controller.dart';

class MedicalsManagementPage extends StatelessWidget {
  const MedicalsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    MedicalsManagementController controller = Get.put(
      MedicalsManagementController(),
    );
    return Scaffold(
      floatingActionButton: Obx(
        () {
          String title = '';
          VoidCallback onTap = () {};

          switch (controller.currentIndex.value) {
            case 0:
              {
                title = 'إضافة لقاح جديد';
                onTap = () =>
                    controller.vaccinesManagementController.addNewVaccine();
                break;
              }
            case 1:
              {
                title = 'إضافة مرض جديد';
                onTap = () =>
                    controller.illnessesManagementController.addNewIllness();
                break;
              }
            case 2:
              {
                title = 'إضافة حالة جديدة';
                onTap = () => controller
                    .psychologicalStatusesManagementController
                    .addNewPsychologicalStatus();
                break;
              }
          }
          return CustomFilledButton(
            height: 74.h,
            width: 300.w,
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      appBar: const CustomAppBar(
        title: 'إدارة الشؤون الصحية',
        iconData: FontAwesomeIcons.syringe,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              TabBar(
                controller: controller.tabController,
                tabs: [
                  MedicalsManagementTabBarItem(
                    title: 'اللقاحات',
                    iconData: FontAwesomeIcons.syringe,
                    toolTipMessage:
                        'اضافة وتعديل اللقاحات التي من الممكن للطالب اخذها قبل او خلال وجوده بالمدرسة',
                    currentIndex: controller.currentIndex,
                    itemIndex: 0,
                  ),
                  MedicalsManagementTabBarItem(
                    title: 'الأمراض',
                    iconData: FontAwesomeIcons.virus,
                    toolTipMessage:
                        'اضافة وتعديل الأمراض التي من الممكن للطالب امتلاكها عند التسجيل بالمدرسة',
                    currentIndex: controller.currentIndex,
                    itemIndex: 1,
                  ),
                  MedicalsManagementTabBarItem(
                    title: 'الحالات الاجتماعية',
                    iconData: FontAwesomeIcons.faceMehBlank,
                    toolTipMessage:
                        'اضافة وتعديل الحالات الاجتماعية أو النفسية للطلاب',
                    currentIndex: controller.currentIndex,
                    itemIndex: 2,
                  ),
                ],
              ),
              AddVerticalSpacing(value: 20.h),
              Expanded(
                child: Obx(
                  () {
                    switch (controller.currentIndex.value) {
                      case 0:
                        {
                          return const VaccinesManagementPage();
                        }
                      case 1:
                        {
                          return const IllnessesManagementPage();
                        }
                      case 2:
                        {
                          return const PsychologicalStatusesManagementPage();
                        }
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

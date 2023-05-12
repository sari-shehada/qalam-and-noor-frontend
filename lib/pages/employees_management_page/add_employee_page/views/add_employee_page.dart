import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/pages/employees_management_page/add_employee_page/controllers/add_employee_controller.dart';
import 'package:kalam_noor/pages/employees_management_page/add_employee_page/views/widgets/employee_registration_form.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    final AddEmployeeController controller = Get.find();
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'إضافة موظف',
        iconData: FontAwesomeIcons.userTie,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.07),
                    offset: const Offset(0, 0),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight:
                              Radius.circular(GlobalStyles.globalBorderRadius),
                          bottomRight:
                              Radius.circular(GlobalStyles.globalBorderRadius),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      child: Column(
                        children: [
                          ...(controller.sections
                              .map<Widget>(
                                (e) => EmployeeSectionTitleWidget(
                                  title: e.sectionName,
                                  isSelected: e.isCurrentOffset,
                                  changeSectionCallback: () =>
                                      controller.animateToSection(e),
                                ),
                              )
                              .toList()),
                          const Spacer(),
                          CustomFilledButton(
                            onTap: () => controller.addEmployee(),
                            // onTap: () =>
                            //     print(controller.scrollController.offset),
                            buttonStatus: controller.buttonStatus,
                            child: 'إضافة موظف',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 65,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(GlobalStyles.globalBorderRadius),
                          topLeft:
                              Radius.circular(GlobalStyles.globalBorderRadius),
                        ),
                      ),
                      child: const EmployeeRegistrationForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeSectionTitleWidget extends StatelessWidget {
  const EmployeeSectionTitleWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.changeSectionCallback,
  });

  final String title;
  final RxBool isSelected;
  final VoidCallback changeSectionCallback;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return Obx(
      () {
        return AnimatedContainer(
          duration: 400.milliseconds,
          decoration: BoxDecoration(
            color: isSelected.value
                ? colorScheme.primaryContainer
                : colorScheme.primaryContainer.withOpacity(0),
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: InkWell(
              onTap: changeSectionCallback,
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  child: Center(
                    child: TweenAnimationBuilder(
                      tween: ColorTween(
                        begin: isSelected.value
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.primary,
                        end: isSelected.value
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      ),
                      duration: 400.milliseconds,
                      builder: (context, value, child) {
                        return Text(
                          title,
                          style: ProjectFonts.titleLarge().copyWith(
                            color: value,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

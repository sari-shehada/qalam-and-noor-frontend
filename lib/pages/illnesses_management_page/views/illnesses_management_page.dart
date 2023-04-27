import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/illness.dart';
import 'package:kalam_noor/pages/illnesses_management_page/views/widgets/illnesses_table.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/custom_appbar.dart';
import '../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../tools/ui_tools/custom_scaffold.dart';
import '../../../tools/ui_tools/labeled_widget.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import '../../../tools/widgets/empty_item_widget.dart';
import '../controllers/illness_management_controller.dart';

class IllnessesManagementPage extends StatelessWidget {
  const IllnessesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    IllnessesManagementController illnessesManagementController =
        Get.put(IllnessesManagementController());
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        height: 74.h,
        width: 300.w,
        onTap: () => illnessesManagementController.addNewIllness(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة مرض جديد',
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
      ),
      appBar: CustomAppBar(
        title: "إدارة الأمراض",
        iconData: FontAwesomeIcons.virus,
        backButtonEnabled: true,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: textTheme.titleLarge,
            ),
            AddHorizontalSpacing(value: 25.w),
            CustomDropDownButton(
              backgroundColor: colorScheme.primaryContainer,
              dropdownColor: colorScheme.primaryContainer,
              value: illnessesManagementController.currentSortingOption,
              items: IllnessesSortingOption.values
                  .map(
                    (e) => DropdownMenuItem<IllnessesSortingOption>(
                      value: e,
                      child: Text(illnessesSortingOptionsAsString[e]!),
                    ),
                  )
                  .toList(),
              onChanged: (IllnessesSortingOption? value) =>
                  illnessesManagementController.changeSortingOption(value),
            ),
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: LabeledWidget(
              label: 'الأمراض الحالية',
              labelTextStyle: TextStyle(
                fontSize: 30.sp,
              ),
              spacing: 35.h,
              child: Obx(() {
                return FutureBuilder<RxList<Illness>>(
                  future: illnessesManagementController.illnesses.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      //TODO: Change later
                      return const Center(
                        child: Text('error loading illnesses'),
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'أمراض',
                          iconData: FontAwesomeIcons.virus,
                        );
                      } else {
                        RxList<Illness> illness =
                            snapshot.data as RxList<Illness>;
                        return Expanded(
                          child: IllnessesTable(illnesses: illness),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/models/public_record.dart';
import 'package:kalam_noor/pages/secretary/public_record_page/controllers/public_record_controller.dart';
import 'package:kalam_noor/pages/secretary/public_record_page/views/widgets/public_record_table.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/loader_widget.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../../../tools/widgets/empty_item_widget.dart';

class PublicRecordPage extends StatelessWidget {
  const PublicRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    PublicRecordController controller = Get.put(PublicRecordController());
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'السجل العام',
        iconData: FontAwesomeIcons.sheetPlastic,
        appBarBoxDecoration: const BoxDecoration(),
        actionButton: Row(
          children: [
            Text(
              'الصف:',
              style: ProjectFonts.titleLarge(),
            ),
            AddHorizontalSpacing(value: 25.w),
            Obx(
              () => CustomDropDownButton(
                backgroundColor: colorScheme.primaryContainer,
                dropdownColor: colorScheme.primaryContainer,
                value: controller.selectedClass,
                items: controller.schoolClasses
                    .map(
                      (e) => DropdownMenuItem<SchoolClass>(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (SchoolClass? value) =>
                    controller.changeClass(value),
              ),
            ),
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: SizedBox.expand(
        child: Column(
          children: [
            AddVerticalSpacing(value: 20.h),
            Obx(() {
              return FutureBuilder<List<PublicRecord>>(
                future: controller.records.value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoaderWidget(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: ErrorLoadingSomethingWidget(
                        somethingName: "السجل العام",
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Expanded(
                        child: EmptyItemWidget(
                          itemName: 'سجلات',
                          iconData: FontAwesomeIcons.sheetPlastic,
                        ),
                      );
                    } else {
                      List<PublicRecord> records =
                          snapshot.data as List<PublicRecord>;
                      return Expanded(
                        child: PublicRecordTable(
                          records: records,
                        ),
                      );
                    }
                  } else {
                    return const Expanded(
                      child: EmptyItemWidget(
                        itemName: 'مراحل دراسية',
                        iconData: FontAwesomeIcons.locationArrow,
                      ),
                    );
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

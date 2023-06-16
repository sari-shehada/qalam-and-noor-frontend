import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/school_class.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/register_new_students_in_school_year/sub_pages/class_selection/views/widgets/school_class_selection_card.dart';

import '../../../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../../../tools/widgets/error_loading_something_widget.dart';
import '../controllers/class_selection_sub_page_controller.dart';

class ClassSelectionPage extends GetView<ClassSelectionSubPageController> {
  const ClassSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(
        () => FutureBuilder<List<SchoolClass>>(
          future: controller.classes.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'مراحل دراسية',
                retryCallback: () => controller.reloadClasses(),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'مراحل دراسية',
                  iconData: FontAwesomeIcons.locationArrow, //TODO:
                );
              } else {
                List<SchoolClass> schoolClasses =
                    snapshot.data as List<SchoolClass>;
                return ListView.separated(
                  // padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: schoolClasses.length,
                  itemBuilder: (context, index) {
                    List<Color> backgroundColors = [
                      Get.theme.scaffoldBackgroundColor.withOpacity(.7),
                      Colors.white,
                    ];
                    return SchoolClassSelectionCard(
                      schoolClass: schoolClasses[index],
                      backgroundColor: backgroundColors[index % 2],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    indent: 20.w,
                    endIndent: 20.w,
                  ),
                );
              }
            } else {
              return const EmptyItemWidget(
                itemName: 'مراحل دراسية',
                iconData: FontAwesomeIcons.locationArrow, //TODO:
              );
            }
          },
        ),
      ),
    );
  }
}

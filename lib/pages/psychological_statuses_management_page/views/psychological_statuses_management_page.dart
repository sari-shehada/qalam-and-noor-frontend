import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/psychological_status.dart';
import 'package:kalam_noor/pages/psychological_statuses_management_page/controllers/psychological_statuses_management_controller.dart';
import 'package:kalam_noor/pages/psychological_statuses_management_page/views/widgets/psychological_statuses_table.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../tools/ui_tools/labeled_widget.dart';
import '../../../tools/widgets/empty_item_widget.dart';

class PsychologicalStatusesManagementPage extends StatelessWidget {
  const PsychologicalStatusesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    PsychologicalStatusesManagementController
        psychologicalStatusesManagementController = Get.find();

    return Column(
      children: [
        Expanded(
          flex: 70,
          child: LabeledWidget(
            label: 'الحالات المزاجية الحالية',
            labelTextStyle: TextStyle(
              fontSize: 30.sp,
            ),
            spacing: 35.h,
            child: Expanded(
              child: Obx(() {
                return FutureBuilder<RxList<PsychologicalStatus>>(
                  future: psychologicalStatusesManagementController
                      .psychologicalStatuses.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LoaderWidget(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const ErrorLoadingSomethingWidget(
                        somethingName: 'حالات نفسية',
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'حالات مزاجية',
                          iconData: FontAwesomeIcons.faceMehBlank,
                        );
                      } else {
                        RxList<PsychologicalStatus> psychologicalStatuses =
                            snapshot.data as RxList<PsychologicalStatus>;
                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: 600.milliseconds,
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: PsychologicalStatusesTable(
                                  psychologicalStatuses: psychologicalStatuses),
                            );
                          },
                        );
                      }
                    } else {
                      return const EmptyItemWidget(
                        itemName: 'حالات مزاجية',
                        iconData: FontAwesomeIcons.faceMehBlank,
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


// return CustomScaffold(
//       floatingActionButton: CustomFilledButton(
//         height: 74.h,
//         width: 300.w,
//         onTap: () => psychologicalStatusesManagementController
//             .addNewPsychologicalStatus(),
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40.w),
//             child: Row(
//               children: [
//                 Text(
//                   'إضافة حالة جديدة',
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const Spacer(),
//                 FaIcon(
//                   FontAwesomeIcons.plus,
//                   color: Colors.white,
//                   size: 28.sp,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       appBar: CustomAppBar(
//         title: "إدارة الحالات المزاجية",
//         iconData: FontAwesomeIcons.faceMehBlank,
//         backButtonEnabled: true,
//         actionButton: Row(
//           children: [
//             Text(
//               'ترتيب حسب:',
//               style: textTheme.titleLarge,
//             ),
//             AddHorizontalSpacing(value: 25.w),
//             CustomDropDownButton(
//               backgroundColor: colorScheme.primaryContainer,
//               dropdownColor: colorScheme.primaryContainer,
//               value: psychologicalStatusesManagementController
//                   .currentSortingOption,
//               items: PsychologicalStatusSortingOption.values
//                   .map((e) =>
//                       DropdownMenuItem<PsychologicalStatusSortingOption>(
//                           value: e,
//                           child: Text(
//                               psychologicalStatusSortingOptionsAsString[e]!)))
//                   .toList(),
//               onChanged: (PsychologicalStatusSortingOption? value) =>
//                   psychologicalStatusesManagementController
//                       .changeSortingOption(value),
//             ),
//           ],
//         ),
//       ),
//       bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 70,
//             child: LabeledWidget(
//               label: 'الحالات المزاجية الحالية',
//               labelTextStyle: TextStyle(
//                 fontSize: 30.sp,
//               ),
//               spacing: 35.h,
//               child: Obx(() {
//                 return FutureBuilder<RxList<PsychologicalStatus>>(
//                   future: psychologicalStatusesManagementController
//                       .psychologicalStatuses.value,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: LoaderWidget(),
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       //TODO: Change later
//                       return const Center(
//                         child: Text('error loading Psychological Statuses'),
//                       );
//                     }
//                     if (snapshot.hasData) {
//                       if (snapshot.data!.isEmpty) {
//                         return const EmptyItemWidget(
//                           itemName: 'حالات مزاجية',
//                           iconData: FontAwesomeIcons.faceMehBlank,
//                         );
//                       } else {
//                         RxList<PsychologicalStatus> psychologicalStatuses =
//                             snapshot.data as RxList<PsychologicalStatus>;
//                         return Expanded(
//                           child: PsychologicalStatusesTable(
//                               psychologicalStatuses: psychologicalStatuses),
//                         );
//                       }
//                     } else {
//                       return const EmptyItemWidget(
//                         itemName: 'حالات مزاجية',
//                         iconData: FontAwesomeIcons.faceMehBlank,
//                       );
//                     }
//                   },
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
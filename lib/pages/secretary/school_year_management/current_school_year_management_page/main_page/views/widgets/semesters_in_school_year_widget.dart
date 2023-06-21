import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/educational/semester.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

// class SemestersInSchoolYearWidget
//     extends GetView<CurrentSchoolYearManagementController> {
//   const SemestersInSchoolYearWidget({super.key});
//   BoxDecoration get containerDecoration => BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(
//           GlobalStyles.globalBorderRadius,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF393939).withOpacity(.06),
//             blurRadius: 60,
//             offset: const Offset(0, 30),
//           ),
//         ],
//       );
//   EdgeInsets get containerPadding => EdgeInsets.only(
//         top: 20.h,
//       );
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => FutureBuilder<List<Semester>>(
//         future: controller.semestersInSchoolYear.value,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Shimmer.fromColors(
//               baseColor: Colors.white.withOpacity(1),
//               highlightColor: Get.theme.scaffoldBackgroundColor,
//               direction: ShimmerDirection.rtl,
//               child: Container(
//                 decoration: containerDecoration,
//                 height: double.infinity,
//                 width: double.infinity,
//               ),
//             );
//           }
//           if (snapshot.hasError) {
//             return Container(
//               padding: containerPadding,
//               decoration: containerDecoration,
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'حدث خطأ اثناء تحميل الفصول الدراسية في العام الدراسي',
//                     style: ProjectFonts.titleMedium(),
//                   ),
//                   AddVerticalSpacing(value: 35.h),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width / 2,
//                     child: CustomFilledButton(
//                       onTap: () => controller.refreshSemestersInSchoolYear(),
//                       child: 'إعادة المحاولة',
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           if (snapshot.hasData) {
//             if (snapshot.data!.isEmpty) {
//               return Container(
//                 padding: containerPadding,
//                 decoration: containerDecoration,
//                 child: const EmptyItemWidget(
//                   itemName: 'فصول',
//                   iconData: FontAwesomeIcons.locationArrow, //TODO:
//                 ),
//               );
//             } else {
//               return Container(
//                 padding: containerPadding,
//                 decoration: containerDecoration,
//                 child: _SemestersDisplayContainer(
//                   semesters: snapshot.data as List<Semester>,
//                 ),
//               );
//             }
//           } else {
//             return Container(
//               padding: containerPadding,
//               decoration: containerDecoration,
//               child: const EmptyItemWidget(
//                 itemName: 'فصول',
//                 iconData: FontAwesomeIcons.locationArrow, //TODO:
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class _SemestersDisplayContainer extends StatelessWidget {
  const _SemestersDisplayContainer({required this.semesters});
  final List<Semester> semesters;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Text(
                'الفصول الدراسية في العام الدراسي',
                style: ProjectFonts.titleLarge(),
              ),
              AddVerticalSpacing(value: 10.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: semesters.length,
                  itemBuilder: (_, index) => _SemesterDisplayCard(
                    semester: semesters[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Get.theme.colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          endIndent: 20.h,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الإجراءات',
                  style: ProjectFonts.titleLarge(),
                ),
                AddVerticalSpacing(value: 20.h),
                CustomFilledButton(
                  onTap: () {},
                  child: 'بدء فصل دراسي جديد',
                ),
                AddVerticalSpacing(value: 15.h),
                CustomOutlinedButton(
                  onTap: () {},
                  child: 'انهاء الفصل الدراسي الحالي',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SemesterDisplayCard extends StatelessWidget {
  const _SemesterDisplayCard({
    required this.semester,
  });
  final Semester semester;
  @override
  Widget build(BuildContext context) {
    final bool isCurrentSemester = !semester.isDone;
    final ColorScheme colorScheme = Get.theme.colorScheme;
    final backColor = isCurrentSemester ? colorScheme.primary : Colors.white;
    final foreColor = isCurrentSemester ? Colors.white : colorScheme.primary;
    final BoxDecoration boxDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10.h),
          blurRadius: 30,
          color: Get.theme.colorScheme.shadow.withOpacity(.09),
        )
      ],
      shape: BoxShape.circle,
      color: backColor,
    );
    return Container(
      height: 150.sp,
      width: 150.sp,
      alignment: Alignment.center,
      decoration: isCurrentSemester
          ? boxDecoration
          : boxDecoration.copyWith(
              border: Border.all(
                color: foreColor,
                width: 4.sp,
              ),
            ),
      child: Text(
        semester.name,
        style: ProjectFonts.titleLarge().copyWith(
          color: foreColor,
        ),
      ),
    );
  }
}

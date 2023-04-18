import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../controllers/new_student_registration_controller.dart';

class NewStudentRegistrationPage extends StatelessWidget {
  const NewStudentRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewStudentRegistrationController controller = Get.put(
      NewStudentRegistrationController(),
    );

    const Color scaffoldBackgroundColor = Color(0xffF5F6F8);
    final TextStyle titleTextStyle = TextStyle(
      fontSize: 20.sp,
      color: Colors.black,
    );
    return Scaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => controller.registerStudent(),
        height: 74.h,
        width: 300.w,
        buttonStatus: controller.buttonStatus,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'تسجيل الطالب',
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
                )
              ],
            ),
          ),
        ),
      ),
      appBar: const CustomAppBar(
        title: 'تسجيل طالب جديد',
        iconData: FontAwesomeIcons.userPlus,
      ),
      backgroundColor: scaffoldBackgroundColor,
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 25.h,
                      ),
                      // height: 500.h,
                      // width: 900.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            color: Colors.black.withOpacity(.06),
                          )
                        ],
                      ),
                      child: LabeledWidget(
                        label: 'المعلومات الشخصية للطالب',
                        labelTextStyle: TextStyle(
                          fontSize: 26.sp,
                          color: Get.theme.colorScheme.primary,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  LabeledWidget(
                                    label: 'رقم سجل الطالب',
                                    child: HintedTextField(
                                      hintText: '',
                                      controller:
                                          controller.publicRecordIdController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  LabeledWidget(
                                    label: 'الأسم الأول',
                                    child: HintedTextField(
                                      controller:
                                          controller.firstNameController,
                                      hintText: '',
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  LabeledWidget(
                                    label: 'الجنس',
                                    child: Obx(
                                      () {
                                        return AnimatedContainer(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.isMale.value == true
                                                    ? Colors.cyan[300]
                                                    : Colors.pink[300],
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 700),
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                              splashColor: Colors.transparent,
                                              onTap: () =>
                                                  controller.toggleGender(),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        controller.isMale
                                                                    .value ==
                                                                true
                                                            ? 'ذكر'
                                                            : 'انثى',
                                                        style: TextStyle(
                                                          fontSize: 22.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      AddHorizontalSpacing(
                                                          value: 30.w),
                                                      Icon(
                                                        controller.isMale
                                                                    .value ==
                                                                true
                                                            ? Icons.male
                                                            : Icons.female,
                                                        size: 25.sp,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  LabeledWidget(
                                    label: 'مكان الولادة',
                                    child: HintedTextField(
                                      controller:
                                          controller.placeOfBirthController,
                                      hintText: '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AddHorizontalSpacing(value: 40.w),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  color: scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 30,
                                      color: Colors.black.withOpacity(.07),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(25.w),
                                child: LabeledWidget(
                                  label: 'تاريخ الولادة',
                                  child: Obx(
                                    () => CalendarDatePicker(
                                      currentDate: controller.dateOfBirth.value,
                                      firstDate: DateTime(2000),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      onDateChanged: (DateTime value) =>
                                          controller.changeDateOfBirth(value),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 25.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            color: Colors.black.withOpacity(.06),
                          )
                        ],
                      ),
                      child: LabeledWidget(
                        label: 'المعلومات المدنية للطالب',
                        labelTextStyle: TextStyle(
                          fontSize: 26.sp,
                          color: Get.theme.colorScheme.primary,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  LabeledWidget(
                                    label: 'الديانة',
                                    child: Obx(
                                      () => DropdownButton<Religion>(
                                        value: controller.religion.value,
                                        onChanged: (value) =>
                                            controller.changeReligion(value),
                                        items: Religion.values
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e,
                                                child:
                                                    Text(religionAsString[e]!),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  LabeledWidget(
                                    label: 'رقم الواقعة',
                                    child: HintedTextField(
                                      hintText: '',
                                      controller:
                                          controller.incidentNumberController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AddHorizontalSpacing(value: 40.w),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  color: scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 30,
                                      color: Colors.black.withOpacity(.07),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(25.w),
                                child: LabeledWidget(
                                  label: 'تاريخ الواقعة',
                                  child: Obx(
                                    () => CalendarDatePicker(
                                      currentDate:
                                          controller.dateOfIncident.value,
                                      firstDate: DateTime(2000),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      onDateChanged: (DateTime value) =>
                                          controller
                                              .changeDateOfIncident(value),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Expanded(
//                 flex: 1,
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     LabeledWidget(
//                       label: 'رقم سجل الطالب',
//                       widget: HintedTextField(
//                         hintText: '',
//                         controller: controller.publicRecordIdController,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'الأسم الأول',
//                       widget: HintedTextField(
//                         controller: controller.firstNameController,
//                         hintText: '',
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'الجنس',
//                       widget: Obx(() {
//                         return AnimatedContainer(
//                           decoration: BoxDecoration(
//                             color: controller.isMale.value == true
//                                 ? Colors.cyan[300]
//                                 : Colors.pink[300],
//                             borderRadius: BorderRadius.circular(14.r),
//                           ),
//                           duration: const Duration(milliseconds: 700),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(14.r),
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(14.r),
//                               splashColor: Colors.transparent,
//                               onTap: () => controller.toggleGender(),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 10.h,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         controller.isMale.value == true
//                                             ? 'ذكر'
//                                             : 'انثى',
//                                         style: TextStyle(
//                                           fontSize: 22.sp,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       AddHorizontalSpacing(value: 30.w),
//                                       Icon(
//                                         controller.isMale.value == true
//                                             ? Icons.male
//                                             : Icons.female,
//                                         size: 25.sp,
//                                         color: Colors.white,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'تاريخ الولادة',
//                       widget: Obx(
//                         () => CalendarDatePicker(
//                           currentDate: controller.dateOfBirth.value,
//                           firstDate: DateTime(2000),
//                           initialDate: DateTime.now(),
//                           lastDate: DateTime.now(),
//                           onDateChanged: (DateTime value) =>
//                               controller.changeDateOfBirth(value),
//                         ),
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'مكان الولادة',
//                       widget: HintedTextField(
//                         controller: controller.firstNameController,
//                         hintText: '',
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'الديانة',
//                       widget: Obx(
//                         () => DropdownButton<Religion>(
//                           value: controller.religion.value,
//                           onChanged: (value) =>
//                               controller.changeReligion(value),
//                           items: Religion.values
//                               .map(
//                                 (e) => DropdownMenuItem(
//                                   value: e,
//                                   child: Text(religionAsString[e]!),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     LabeledWidget(
//                       label: 'رقم الواقعة',
//                       widget: HintedTextField(
//                         hintText: '',
//                         controller: controller.incidentNumberController,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'تاريخ الواقعة',
//                       widget: Obx(
//                         () => CalendarDatePicker(
//                           currentDate: controller.dateOfIncident.value,
//                           firstDate: DateTime(1900),
//                           initialDate: DateTime.now(),
//                           lastDate: DateTime.now(),
//                           onDateChanged: (DateTime value) =>
//                               controller.changeDateOfIncident(value),
//                         ),
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'رقم الهاتف',
//                       widget: HintedTextField(
//                         hintText: '',
//                         controller: controller.phoneNumberController,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'رقم الواتساب',
//                       widget: HintedTextField(
//                         hintText: '',
//                         controller: controller.phoneNumberController,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                     LabeledWidget(
//                       label: 'رقم الهاتف الأرضي',
//                       widget: HintedTextField(
//                         hintText: '',
//                         controller: controller.phoneNumberController,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: [
//                     LabeledWidget(
//                       label: 'تاريخ الانضمام الى المدرسة',
//                       widget: Obx(
//                         () => CalendarDatePicker(
//                           currentDate: controller.joinDate.value,
//                           firstDate: DateTime(1900),
//                           initialDate: DateTime.now(),
//                           lastDate: DateTime.now(),
//                           onDateChanged: (DateTime value) =>
//                               controller.changeJoinDate(value),
//                         ),
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: [],
//                 ),
//               ),

class LabeledWidget extends StatelessWidget {
  const LabeledWidget({
    super.key,
    required this.label,
    this.spacing = 20,
    required this.child,
    this.labelTextStyle,
    this.mainAxisSize = MainAxisSize.max,
  });

  final String label;
  final double spacing;
  final Widget child;
  final TextStyle? labelTextStyle;
  final MainAxisSize mainAxisSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: labelTextStyle ??
                TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
          ),
        ),
        AddVerticalSpacing(value: spacing.h),
        child
      ],
    );
  }
}

// Padding(
//         padding: EdgeInsets.all(30.w),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //student info card
//             Column(
//               children: [
//                 //main info
//                 Container(
//                   padding: EdgeInsets.all(15.w),
//                   width: 660.w,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15.r)),
//                   child: Row(
//                     children: [
//                       Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             CircleAvatar(
//                               radius: 65.r,
//                               child: Image.asset(
//                                 GlobalAssets.maleAvatarCircular,
//                               ),
//                             ),
//                             AddVerticalSpacing(value: 20.h),
//                             SizedBox(
//                               width: 230.w,
//                               child: CallToActionButton(
//                                   backgroundColor: const Color(0xff255CB1),
//                                   child: "اختر الصورة الشخصية للطالب",
//                                   onTap: () {}),
//                             ),
//                             AddVerticalSpacing(value: 20.h),
//                             SizedBox(
//                               width: 230.w,
//                               child: HintedTextField(
//                                   hintText: "رقم السجل",
//                                   controller: TextEditingController()),
//                             ),
//                           ]),
//                       AddHorizontalSpacing(value: 30.w),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SizedBox(
//                             width: 360.w,
//                             child: HintedTextField(
//                                 hintText: "اسم الطالب",
//                                 controller: TextEditingController()),
//                           ),
//                           AddVerticalSpacing(value: 20.h),
//                           SizedBox(
//                             width: 360.w,
//                             child: HintedTextField(
//                                 hintText: "اسم الأب",
//                                 controller: TextEditingController()),
//                           ),
//                           AddVerticalSpacing(value: 20.h),
//                           SizedBox(
//                             width: 360.w,
//                             child: HintedTextField(
//                                 hintText: "الكنية",
//                                 controller: TextEditingController()),
//                           ),
//                           AddVerticalSpacing(value: 20.h),
//                           SizedBox(
//                             width: 360.w,
//                             child: HintedTextField(
//                                 hintText: "اسم الأم",
//                                 controller: TextEditingController()),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 AddVerticalSpacing(value: 20.h),
//                 //additional info
//                 Container(
//                   padding: EdgeInsets.all(20.w),
//                   height: 660.h,
//                   width: 660.w,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15.r)),
//                   child: Column(
//                     children: [
//                       Text(
//                         "معلومات إضافية عن الطالب",
//                         style: ProjectFonts.titleMedium,
//                       ),
//                       AddVerticalSpacing(value: 15.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           //class dropDown
//                           Container(
//                             width: 230.w,
//                             padding: EdgeInsets.all(5.w),
//                             decoration: BoxDecoration(
//                                 color: Colors.indigo,
//                                 borderRadius: BorderRadius.circular(30.r)),
//                             child: DropdownButton(
//                                 underline: Container(
//                                   color: Colors.transparent,
//                                 ),
//                                 iconEnabledColor: Colors.white,
//                                 focusColor: Colors.transparent,
//                                 hint: const Text(
//                                   "  اختر الصف من هنا",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 items: [
//                                   "الأول",
//                                   "الثاني",
//                                   "الثالث",
//                                   "الرابع",
//                                   "الخامس",
//                                   "السادس",
//                                   "السابع",
//                                   "الثامن",
//                                   "التاسع"
//                                 ]
//                                     .map((e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text("الصف $e"),
//                                         ))
//                                     .toList(),
//                                 onChanged: (word) {}),
//                           ),
//                           //classRoom
//                           SizedBox(
//                             width: 150.w,
//                             child: HintedTextField(
//                                 hintText: "الشعبة",
//                                 controller: TextEditingController()),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             AddHorizontalSpacing(value: 20.w),
//             //parents and medical info card
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     //father card
//                     Container(
//                       padding: EdgeInsets.all(20.w),
//                       height: 540.h,
//                       width: 500.w,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15.r)),
//                       child: Column(
//                         children: [
//                           Text(
//                             "معلومات أبو الطالب",
//                             style: ProjectFonts.titleMedium,
//                           ),
//                           AddVerticalSpacing(value: 20.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               //column 1
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "اسم الأب",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "اسم الأم",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "الكنية",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "مكان الولادة",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                         hintText: "todo",
//                                         controller: TextEditingController()),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                         hintText: "todo",
//                                         controller: TextEditingController()),
//                                   ),
//                                 ],
//                               ),
//                               AddHorizontalSpacing(value: 30.w),
//                               //column 2
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "المهنة",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "مكان القيد",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "رقم القيد",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: HintedTextField(
//                                       controller: TextEditingController(),
//                                       hintText: "الرقم الوطني",
//                                     ),
//                                   ),
//                                   AddVerticalSpacing(value: 20.h),
//                                   //TODO:get a simple imoje about fathers
//                                   Container(
//                                     width: 90,
//                                     height: 90,
//                                     color: Colors.grey,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     AddHorizontalSpacing(value: 20.w),
//                     //medical info card
//                     Container(
//                       padding: EdgeInsets.all(20.w),
//                       width: 200.w,
//                       height: 540.h,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15.r)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "المعلومات الصحية",
//                             style: ProjectFonts.titleMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 20.h),
//                   ],
//                 ),
//                 AddVerticalSpacing(value: 20.h),
//                 //mother card
//                 Container(
//                   padding: EdgeInsets.all(20.w),
//                   height: 440.h,
//                   width: 715.w,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15.r)),
//                   child: Column(
//                     children: [
//                       Text(
//                         "معلومات أم الطالب",
//                         style: ProjectFonts.titleMedium,
//                       ),
//                       AddVerticalSpacing(value: 15.h)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             AddHorizontalSpacing(value: 20.w),
//             Container(
//               height: 800,
//               width: 200,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(15)),
//             )
//           ],
//         ),
//       ),

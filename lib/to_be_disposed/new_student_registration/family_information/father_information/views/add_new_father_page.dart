// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../../../configs/fonts.dart';
// import '../../../../../configs/styles.dart';
// import '../../../../../models/agendas/father.dart';
// import '../../../../../models/enums.dart';
// import 'widgets/father_civil_information.dart';
// import 'widgets/father_full_name.dart';
// import '../../../../../tools/dialogs_services/snack_bar_service.dart';
// import '../../../../../tools/ui_tools/buttons.dart';
// import '../../../../../tools/ui_tools/ui_tools.dart';

// class AddNewFatherPage extends StatefulWidget {
//   const AddNewFatherPage({super.key, this.father});

//   final Father? father;
//   @override
//   State<AddNewFatherPage> createState() => _AddNewFatherPageState();
// }

// class _AddNewFatherPageState extends State<AddNewFatherPage> {
//   _AddNewFatherPageState();
//   bool isAddMode = true;
//   CustomButtonStatus addButtonStatus = CustomButtonStatus.enabled;
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController fatherController = TextEditingController();
//   TextEditingController motherController = TextEditingController();
//   TextEditingController tiePlaceController = TextEditingController();
//   TextEditingController tieNumberController = TextEditingController();
//   TextEditingController residenceController = TextEditingController();
//   TextEditingController careerController = TextEditingController();
//   TextEditingController placeOfBirthController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController permanentAddressController = TextEditingController();
//   TextEditingController civilRegistrySecretariatController =
//       TextEditingController();

//   Religion? religion;
//   EducationalStatus? educationalStatus;
//   DateTime? dateOfBirth;

//   @override
//   void initState() {
//     Father? father = widget.father;
//     if (father != null) {
//       fillFatherInfo(father);
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F6F8),
//       body: Padding(
//         padding: EdgeInsets.all(25.w),
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.all(20.w),
//             width: 1300.w,
//             decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(GlobalStyles.globalBorderRadius),
//                 color: Colors.indigo),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     FatherFullName(
//                         firstNameController: firstNameController,
//                         lastNameController: lastNameController,
//                         grandFatherController: fatherController,
//                         grandMotherController: motherController),
//                     AddVerticalSpacing(value: 20.h),
//                     FatherCivilInformation(
//                       placeOfRegistrationController: tiePlaceController,
//                       numberOfRegistrationController: tieNumberController,
//                       residenceController: residenceController,
//                       placeOfBirthController: placeOfBirthController,
//                       jobController: careerController,
//                       civilRegistrySecretariatController:
//                           civilRegistrySecretariatController,
//                       phoneNumberController: phoneNumberController,
//                     ),
//                   ],
//                 ),
//                 AddHorizontalSpacing(value: 20.w),
//                 //father personal info
//                 Column(
//                   children: [
//                     //personal info about the father
//                     Container(
//                       padding: EdgeInsets.all(30.w),
//                       height: 860.h,
//                       width: 600.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(
//                             GlobalStyles.globalBorderRadius),
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "معلومات شخصية عن الأب",
//                             style: ProjectFonts.titleLarge,
//                           ),
//                           AddVerticalSpacing(value: 40.h),
//                           Row(
//                             children: [
//                               //father religion
//                               Container(
//                                 width: 250.w,
//                                 height: 90.h,
//                                 padding: EdgeInsets.all(10.w),
//                                 decoration: BoxDecoration(
//                                     color: Colors.indigo,
//                                     borderRadius: BorderRadius.circular(30.r)),
//                                 child: DropdownButton(
//                                   underline: Container(
//                                     color: Colors.transparent,
//                                   ),
//                                   iconEnabledColor: Colors.white,
//                                   focusColor: Colors.transparent,
//                                   hint: Text(
//                                     "الديانة",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 21.sp),
//                                   ),
//                                   value: religion,
//                                   items: Religion.values
//                                       .map(
//                                         (e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(religionAsString[e]!),
//                                         ),
//                                       )
//                                       .toList(),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       religion = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               AddHorizontalSpacing(value: 30.w),
//                               //father educational status
//                               Container(
//                                 width: 250.w,
//                                 height: 90.h,
//                                 padding: EdgeInsets.all(10.w),
//                                 decoration: BoxDecoration(
//                                     color: Colors.indigo,
//                                     borderRadius: BorderRadius.circular(30.r)),
//                                 child: DropdownButton(
//                                   underline: Container(
//                                     color: Colors.transparent,
//                                   ),
//                                   iconEnabledColor: Colors.white,
//                                   focusColor: Colors.transparent,
//                                   hint: Text(
//                                     "الحالة التعليمية",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 21.sp),
//                                   ),
//                                   value: educationalStatus,
//                                   items: EducationalStatus.values
//                                       .map(
//                                         (e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(
//                                               educationalStatusAsString[e]!),
//                                         ),
//                                       )
//                                       .toList(),
//                                   onChanged: (value) {
//                                     setState(
//                                       () {
//                                         educationalStatus = value!;
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                           AddVerticalSpacing(value: 30.h),
//                           Text(
//                             "تاريخ الميلاد",
//                             style: ProjectFonts.titleLarge,
//                           ),
//                           AddVerticalSpacing(value: 40.h),
//                           CalendarDatePicker(
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(1950),
//                             lastDate: DateTime.now(),
//                             onDateChanged: (date) {
//                               dateOfBirth = date;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(value: 30.h),
//                     SizedBox(
//                       width: 600.w,
//                       child: CustomFilledButton(
//                         labelColor: Colors.indigo,
//                         backgroundColor: Colors.white,
//                         child: isAddMode ? "إضافة أب" : "تعديل معلومات الأب",
//                         loadingColor: Colors.indigo,
//                         buttonStatus: Rx<CustomButtonStatus>(addButtonStatus),
//                         onTap: () => addFather(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   fillFatherInfo(Father father) {
//     isAddMode = false;
//     firstNameController.text = father.firstName;
//     lastNameController.text = father.lastName;
//     fatherController.text = father.fatherName;
//     motherController.text = father.motherName;
//     tieNumberController.text = father.tieNumber.toString();
//     tiePlaceController.text = father.tiePlace;
//     dateOfBirth = father.dateOfBirth;
//     religion = father.religion;
//     residenceController.text = father.placeOfResidence;
//     placeOfBirthController.text = father.placeOfBirth;
//     educationalStatus = father.educationalStatus;
//     phoneNumberController.text = father.phoneNumber;
//     permanentAddressController.text = father.permanentAddress;
//     careerController.text = father.career;
//   }

//   Future<void> addFather() async {
//     {
//       try {
//         setState(() {
//           addButtonStatus = CustomButtonStatus.processing;
//         });
//         if (validateFields()) {
//           Father father = Father(
//             id: -1,
//             firstName: firstNameController.text,
//             lastName: lastNameController.text,
//             fatherName: fatherController.text,
//             motherName: motherController.text,
//             career: careerController.text,
//             placeOfResidence: residenceController.text,
//             tieNumber: int.parse(tieNumberController.text),
//             tiePlace: tiePlaceController.text,
//             placeOfBirth: placeOfBirthController.text,
//             dateOfBirth: dateOfBirth!,
//             religion: religion!,
//             educationalStatus: educationalStatus!,
//             phoneNumber: phoneNumberController.text,
//             permanentAddress: '',
//             civilRegisterSecretary: '', //TODO:
//           );
//           if (await dummyAddFatherToDB(father)) {
//             Get.back(result: father);
//           }
//         }
//       } finally {
//         setState(() {
//           addButtonStatus = CustomButtonStatus.enabled;
//         });
//       }
//     }
//   }

//   bool validateFields() {
//     // return true;
//     if (firstNameController.text.isEmpty ||
//         lastNameController.text.isEmpty ||
//         fatherController.text.isEmpty ||
//         motherController.text.isEmpty) {
//       SnackbarService.showErrorSnackBar(
//           title: "بعض اجزاء إسم الأب الكامل فارغة",
//           message: "الرجاء تعبئة جميع الحقول");
//       return false;
//     }
//     if (tiePlaceController.text.isEmpty ||
//         tieNumberController.text.isEmpty ||
//         residenceController.text.isEmpty ||
//         placeOfBirthController.text.isEmpty ||
//         careerController.text.isEmpty ||
//         civilRegistrySecretariatController.text.isEmpty) {
//       SnackbarService.showErrorSnackBar(
//           title: "بعض اجزاء المعلومات المدنية لا تزال فارغة",
//           message: "الرجاء تعبئة جميع الحقول");
//       return false;
//     }
//     if (religion == null || educationalStatus == null || dateOfBirth == null) {
//       SnackbarService.showErrorSnackBar(
//           title: "بعض اجزاء المعلومات الشخصية لا تزال ناقصة",
//           message: "الرجاء اختيار قيم المعلومات الشخصية");
//       return false;
//     }
//     return true;
//   }
// }

// Future<bool> dummyAddFatherToDB(Father father) async {
//   await Future.delayed(const Duration(seconds: 2));
//   return true;
// }

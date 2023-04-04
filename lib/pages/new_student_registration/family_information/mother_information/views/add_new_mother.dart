import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import '../../../../../configs/styles.dart';
import '../../../../../models/enums.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';

class AddNewMother extends StatefulWidget {
  const AddNewMother({super.key, this.mother});
  final Mother? mother;
  @override
  State<AddNewMother> createState() => _AddNewMotherState();
}

class _AddNewMotherState extends State<AddNewMother> {
  _AddNewMotherState();
  bool isAddMode = true;
  CallToActionButtonStatus addButtonStatus = CallToActionButtonStatus.enabled;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController careerController = TextEditingController();
  TextEditingController fatherController = TextEditingController();
  TextEditingController motherController = TextEditingController();
  TextEditingController tiePlaceController = TextEditingController();
  TextEditingController tieNumberController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  Religion? religion;
  EducationalStatus? educationalStatus;
  DateTime? dateOfBirth;
  @override
  void initState() {
    Mother? mother = widget.mother;
    if (mother != null) {
      fillMotherInfo(mother);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.w),
        child: Center(
            child: Container(
          padding: EdgeInsets.all(20.w),
          width: 1300.w,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              color: Colors.indigo),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(25.w),
                    width: 1020.w,
                    height: 290.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        GlobalStyles.globalBorderRadius,
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: firstNameController,
                                hintText: "الإسم الأول",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: lastNameController,
                                hintText: "اللقب",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: careerController,
                                hintText: "المهنة أو الوظيفة",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                          ],
                        ),
                        AddHorizontalSpacing(value: 30.w),
                        Column(
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: fatherController,
                                hintText: "إسم الأب",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: motherController,
                                hintText: "إسم الأم",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: placeOfBirthController,
                                hintText: "محل الولادة",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                          ],
                        ),
                        AddHorizontalSpacing(value: 30.w),
                        Column(
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: tiePlaceController,
                                hintText: "محل القيد",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: tieNumberController,
                                hintText: "رقم القيد",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 300.w,
                              child: HintedTextField(
                                controller: phoneNumberController,
                                hintText: "رقم الهاتف المحمول",
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow("[ا-ي]")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  //TODO
                  Container(
                    height: 290.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        GlobalStyles.globalBorderRadius,
                      ),
                      color: Colors.white,
                    ),
                    child: Text("TODO: get some cool image"),
                  ),
                ],
              ),
              AddVerticalSpacing(value: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(25.w),
                    height: 650.h,
                    width: 600.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            GlobalStyles.globalBorderRadius),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //mother religion
                        Container(
                          width: 250.w,
                          height: 90.h,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: DropdownButton(
                            dropdownColor: Colors.indigo,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              color: Colors.transparent,
                            ),
                            iconEnabledColor: Colors.white,
                            focusColor: Colors.transparent,
                            hint: Text(
                              "الديانة",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 21.sp),
                            ),
                            value: religion,
                            items: Religion.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (Value) {
                              setState(() {
                                religion = Value!;
                              });
                            },
                          ),
                        ),
                        AddHorizontalSpacing(value: 30.w),
                        //mother educational status
                        Container(
                          width: 250.w,
                          height: 90.h,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: DropdownButton(
                            dropdownColor: Colors.indigo,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              color: Colors.transparent,
                            ),
                            iconEnabledColor: Colors.white,
                            focusColor: Colors.transparent,
                            hint: Text(
                              "الحالة التعليمية",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 21.sp),
                            ),
                            value: educationalStatus,
                            items: EducationalStatus.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  educationalStatus = value!;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(25.w),
                        height: 580.h,
                        width: 600.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                GlobalStyles.globalBorderRadius),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              "تاريخ الميلاد",
                              style: ProjectFonts.titleLarge,
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              height: 400.h,
                              child: CalendarDatePicker(
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                onDateChanged: (date) {
                                  dateOfBirth = date;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      AddVerticalSpacing(value: 20.h),
                      SizedBox(
                        width: 400.w,
                        child: CallToActionButton(
                          backgroundColor: Colors.white,
                          labelColor: Colors.indigo,
                          child: "إضافة الأم",
                          buttonStatus:
                              Rx<CallToActionButtonStatus>(addButtonStatus),
                          loadingColor: Colors.indigo,
                          onTap: () => addMother(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  fillMotherInfo(Mother mother) {
    isAddMode = false;
    firstNameController.text = mother.firstName;
    lastNameController.text = mother.lastName;
    fatherController.text = mother.fatherName;
    motherController.text = mother.motherName;
    tieNumberController.text = mother.tieNumber.toString();
    tiePlaceController.text = mother.tiePlace;
    dateOfBirth = mother.dateOfBirth;
    religion = mother.religion;
    placeOfBirthController.text = mother.placeOfBirth;
    educationalStatus = mother.educationalStatus;
    phoneNumberController.text = mother.phoneNumber;
    careerController.text = mother.career;
  }

  Future<void> addMother() async {
    {
      try {
        setState(() {
          addButtonStatus = CallToActionButtonStatus.processing;
        });
        if (validateFields()) {
          Mother mother = Mother(
            id: -1,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            fatherName: fatherController.text,
            motherName: motherController.text,
            career: careerController.text,
            tieNumber: int.parse(tieNumberController.text),
            tiePlace: tiePlaceController.text,
            placeOfBirth: placeOfBirthController.text,
            dateOfBirth: dateOfBirth!,
            religion: religion!,
            educationalStatus: educationalStatus!,
            phoneNumber: phoneNumberController.text,
            doesLiveWithHusband: true, //TODO:
          );
          if (await dummyAddMotherToDB(mother)) {
            Get.back(result: mother);
          }
        }
      } catch (e) {
      } finally {
        setState(() {
          addButtonStatus = CallToActionButtonStatus.enabled;
        });
      }
    }
  }

  bool validateFields() {
    // return true;
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        fatherController.text.isEmpty ||
        motherController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: "بعض اجزاء الإسم الكامل فارغة",
          message: "الرجاء تعبئة جميع الحقول");
      return false;
    }
    if (tiePlaceController.text.isEmpty ||
        tieNumberController.text.isEmpty ||
        placeOfBirthController.text.isEmpty ||
        careerController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: "بعض اجزاء المعلومات المدنية لا تزال فارغة",
          message: "الرجاء تعبئة جميع الحقول");
      return false;
    }
    if (religion == null || educationalStatus == null || dateOfBirth == null) {
      SnackbarService.showErrorSnackBar(
          title: "بعض اجزاء المعلومات الشخصية لا تزال ناقصة",
          message: "الرجاء اختيار قيم المعلومات الشخصية");
      return false;
    }
    return true;
  }
}

Future<bool> dummyAddMotherToDB(Mother mother) async {
  await Future.delayed(Duration(seconds: 2));
  return true;
}

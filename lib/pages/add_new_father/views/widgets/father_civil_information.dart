import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class FatherCivilInformation extends StatelessWidget {
  const FatherCivilInformation({
    super.key,
    required this.placeOfRegistrationController,
    required this.numberOfRegistrationController,
    required this.residenceController,
    required this.placeOfBirthController,
    required this.jobController,
    required this.civilRegistrySecretariatController,
    required this.phoneNumberController,
  });

  final TextEditingController placeOfRegistrationController;
  final TextEditingController numberOfRegistrationController;
  final TextEditingController residenceController;
  final TextEditingController placeOfBirthController;
  final TextEditingController jobController;
  final TextEditingController civilRegistrySecretariatController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      width: 600.w,
      height: 675.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "المعلومات المدنية عن الأب",
            style: ProjectFonts.titleLarge,
          ),
          AddVerticalSpacing(value: 30.h),
          Column(
            children: [
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: placeOfRegistrationController,
                    hintText: "محل القيد",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[ا-ي]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: numberOfRegistrationController,
                    hintText: "رقم القيد",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[0-9]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: residenceController,
                    hintText: "محل الإقامة",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[ا-ي]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: placeOfBirthController,
                    hintText: "محل الولادة",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[ا-ي]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: jobController,
                    hintText: "الوظيفة أو المهنة",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[ا-ي]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: civilRegistrySecretariatController,
                    hintText: "أمانة السجل المدني",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[ا-ي]")
                    ]),
              ),
              AddVerticalSpacing(value: 20.h),
              SizedBox(
                width: 270.w,
                child: HintedTextField(
                    controller: phoneNumberController,
                    hintText: "رقم الهاتف المحمول",
                    inputFormatters: [
                      FilteringTextInputFormatter.allow("[0-9]")
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


//TODO: Permanent Address
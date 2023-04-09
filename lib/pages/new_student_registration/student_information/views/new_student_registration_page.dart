import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../configs/assets.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/text_fields.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class NewStudentRegistrationPage extends StatelessWidget {
  const NewStudentRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //student info card
            Column(
              children: [
                //main info
                Container(
                  padding: EdgeInsets.all(15.w),
                  width: 660.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 65.r,
                              child: Image.asset(
                                GlobalAssets.maleAvatarCircular,
                              ),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 230.w,
                              child: CallToActionButton(
                                  backgroundColor: const Color(0xff255CB1),
                                  child: "اختر الصورة الشخصية للطالب",
                                  onTap: () {}),
                            ),
                            AddVerticalSpacing(value: 20.h),
                            SizedBox(
                              width: 230.w,
                              child: HintedTextField(
                                  hintText: "رقم السجل",
                                  controller: TextEditingController()),
                            ),
                          ]),
                      AddHorizontalSpacing(value: 30.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 360.w,
                            child: HintedTextField(
                                hintText: "اسم الطالب",
                                controller: TextEditingController()),
                          ),
                          AddVerticalSpacing(value: 20.h),
                          SizedBox(
                            width: 360.w,
                            child: HintedTextField(
                                hintText: "اسم الأب",
                                controller: TextEditingController()),
                          ),
                          AddVerticalSpacing(value: 20.h),
                          SizedBox(
                            width: 360.w,
                            child: HintedTextField(
                                hintText: "الكنية",
                                controller: TextEditingController()),
                          ),
                          AddVerticalSpacing(value: 20.h),
                          SizedBox(
                            width: 360.w,
                            child: HintedTextField(
                                hintText: "اسم الأم",
                                controller: TextEditingController()),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                AddVerticalSpacing(value: 20.h),
                //additional info
                Container(
                  padding: EdgeInsets.all(20.w),
                  height: 660.h,
                  width: 660.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      Text(
                        "معلومات إضافية عن الطالب",
                        style: ProjectFonts.titleMedium,
                      ),
                      AddVerticalSpacing(value: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //class dropDown
                          Container(
                            width: 230.w,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: DropdownButton(
                                underline: Container(
                                  color: Colors.transparent,
                                ),
                                iconEnabledColor: Colors.white,
                                focusColor: Colors.transparent,
                                hint: const Text(
                                  "  اختر الصف من هنا",
                                  style: TextStyle(color: Colors.white),
                                ),
                                items: [
                                  "الأول",
                                  "الثاني",
                                  "الثالث",
                                  "الرابع",
                                  "الخامس",
                                  "السادس",
                                  "السابع",
                                  "الثامن",
                                  "التاسع"
                                ]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text("الصف $e"),
                                        ))
                                    .toList(),
                                onChanged: (word) {}),
                          ),
                          //classRoom
                          SizedBox(
                            width: 150.w,
                            child: HintedTextField(
                                hintText: "الشعبة",
                                controller: TextEditingController()),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AddHorizontalSpacing(value: 20.w),
            //parents and medical info card
            Column(
              children: [
                Row(
                  children: [
                    //father card
                    Container(
                      padding: EdgeInsets.all(20.w),
                      height: 540.h,
                      width: 500.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Column(
                        children: [
                          Text(
                            "معلومات أبو الطالب",
                            style: ProjectFonts.titleMedium,
                          ),
                          AddVerticalSpacing(value: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //column 1
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "اسم الأب",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "اسم الأم",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "الكنية",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "مكان الولادة",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                        hintText: "todo",
                                        controller: TextEditingController()),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                        hintText: "todo",
                                        controller: TextEditingController()),
                                  ),
                                ],
                              ),
                              AddHorizontalSpacing(value: 30.w),
                              //column 2
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "المهنة",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "مكان القيد",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "رقم القيد",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  SizedBox(
                                    width: 200.w,
                                    child: HintedTextField(
                                      controller: TextEditingController(),
                                      hintText: "الرقم الوطني",
                                    ),
                                  ),
                                  AddVerticalSpacing(value: 20.h),
                                  //TODO:get a simple imoje about fathers
                                  Container(
                                    width: 90,
                                    height: 90,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    //medical info card
                    Container(
                      padding: EdgeInsets.all(20.w),
                      width: 200.w,
                      height: 540.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "المعلومات الصحية",
                            style: ProjectFonts.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    AddVerticalSpacing(value: 20.h),
                  ],
                ),
                AddVerticalSpacing(value: 20.h),
                //mother card
                Container(
                  padding: EdgeInsets.all(20.w),
                  height: 440.h,
                  width: 715.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      Text(
                        "معلومات أم الطالب",
                        style: ProjectFonts.titleMedium,
                      ),
                      AddVerticalSpacing(value: 15.h)
                    ],
                  ),
                ),
              ],
            ),
            AddHorizontalSpacing(value: 20.w),
            Container(
              height: 800,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}

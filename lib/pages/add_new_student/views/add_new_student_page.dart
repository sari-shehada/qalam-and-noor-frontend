import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../configs/assets.dart';
import '../../../configs/fonts.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../../tools/ui_tools/text_fields.dart';
import '../../../tools/ui_tools/ui_tools.dart';

class AddNewStudentPage extends StatelessWidget {
  const AddNewStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.withOpacity(.6),
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
                              radius: 50.r,
                              child: Image.asset(
                                GlobalAssets.maleAvatarCircular,
                              ),
                            ),
                            AddVerticalSpacing(value: 10.h),
                            SizedBox(
                              width: 230.w,
                              child: CallToActionButton(
                                  label: "اختر الصورة الشخصية للطالب",
                                  onTap: () {}),
                            ),
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
                  height: 360.h,
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
                            width: 180.w,
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
            //parents info card
            Column(
              children: [
                //father card
                Container(
                  padding: EdgeInsets.all(20.w),
                  height: 360.h,
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
                      AddVerticalSpacing(value: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //column 1
                          SizedBox(
                            height: 270.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "اسم الأب",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "اسم الأم",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "الكنية",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "مكان الولادة",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          //column 2
                          SizedBox(
                            height: 270.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "المهنة",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "مكان القيد",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "رقم القيد",
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "الرقم الوطني",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AddVerticalSpacing(value: 20.h),
                //mother card
                Container(
                  padding: EdgeInsets.all(20.w),
                  height: 300.h,
                  width: 500.w,
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
            //medical info card
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  width: 200.w,
                  height: 600.h,
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
                SizedBox(
                    width: 200.w,
                    child:
                        CallToActionButton(label: "اضافة الطالب", onTap: () {}))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

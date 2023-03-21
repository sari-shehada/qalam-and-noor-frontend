import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //student info card
            Column(
              children: [
                //main info
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 300,
                  width: 660,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child: Image.asset(
                                GlobalAssets.maleAvatarCircular,
                              ),
                            ),
                            const AddVerticalSpacing(value: 10),
                            SizedBox(
                              width: 230,
                              child: CallToActionButton(
                                  label: "اختر الصورة الشخصية للطالب",
                                  onTap: () {}),
                            ),
                            SizedBox(
                              width: 230,
                              child: HintedTextField(
                                  hintText: "رقم السجل",
                                  controller: TextEditingController()),
                            ),
                          ]),
                      const AddHorizontalSpacing(value: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 360,
                            child: HintedTextField(
                                hintText: "اسم الطالب",
                                controller: TextEditingController()),
                          ),
                          SizedBox(
                            width: 360,
                            child: HintedTextField(
                                hintText: "اسم الأب",
                                controller: TextEditingController()),
                          ),
                          SizedBox(
                            width: 360,
                            child: HintedTextField(
                                hintText: "الكنية",
                                controller: TextEditingController()),
                          ),
                          SizedBox(
                            width: 360,
                            child: HintedTextField(
                                hintText: "اسم الأم",
                                controller: TextEditingController()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const AddVerticalSpacing(value: 20),
                //additional info
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 360,
                  width: 660,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Text(
                        "معلومات إضافية عن الطالب",
                        style: ProjectFonts.titleMedium,
                      ),
                      const AddVerticalSpacing(value: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //class dropDown
                          Container(
                            width: 180,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30)),
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
                            width: 150,
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
            const AddHorizontalSpacing(value: 20),
            //parents info card
            Column(
              children: [
                //father card
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 360,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Text(
                        "معلومات أبو الطالب",
                        style: ProjectFonts.titleMedium,
                      ),
                      const AddVerticalSpacing(value: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //column 1
                          SizedBox(
                            height: 270,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "اسم الأب",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "اسم الأم",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "الكنية",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "مكان الولادة",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const AddHorizontalSpacing(value: 30),
                          //column 2
                          SizedBox(
                            height: 270,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "المهنة",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "مكان القيد",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: HintedTextField(
                                    controller: TextEditingController(),
                                    hintText: "رقم القيد",
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
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
                const AddVerticalSpacing(value: 20),
                //mother card
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Text(
                        "معلومات أم الطالب",
                        style: ProjectFonts.titleMedium,
                      ),
                      const AddVerticalSpacing(value: 15)
                    ],
                  ),
                ),
              ],
            ),
            const AddHorizontalSpacing(value: 20),
            //medical info card
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
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
                const AddVerticalSpacing(value: 20),
                SizedBox(
                    width: 200,
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

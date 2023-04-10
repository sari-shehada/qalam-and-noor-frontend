import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/educational/class.dart';
import 'package:kalam_noor/pages/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/pages/school_classes_management/controllers/school_classes_management_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';

import '../../../configs/fonts.dart';

class SchoolClassesManagementPage extends StatelessWidget {
  const SchoolClassesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolClassesManagementController controller = Get.put(
      SchoolClassesManagementController(),
    );
    const Color scaffoldBackgroundColor = Color(0xffF5F6F8);
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'إدارة المراحل الدراسية',
        iconData: FontAwesomeIcons.book,
      ),
      body: SizedBox.expand(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 25.h,
              ),
              height: 400.h,
              width: 1300.w,
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
                spacing: 50.h,
                label: 'المراحل الدراسية الحالية',
                labelTextStyle: TextStyle(
                  fontSize: 26.sp,
                  color: Get.theme.colorScheme.primary,
                ),
                child: FutureBuilder(
                  future: controller.classes,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<Class> classes = snapshot.data!;
                        //TODO:
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 100.h,
                            ),
                            shrinkWrap: true,
                            itemCount: classes.length,
                            itemBuilder: (cxt, index) {
                              return ListTile(
                                // style: ListTileStyle(),
                                title: Text(classes[index].name),
                                trailing: CallToActionButton(
                                  width: 200.w,
                                  useShadow: false,
                                  backgroundColor:
                                      Get.theme.colorScheme.primaryContainer,
                                  onTap: () {},
                                  child: Text(
                                    'تعديل الصف',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Get.theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('No classes found'),
                        );
                      }
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

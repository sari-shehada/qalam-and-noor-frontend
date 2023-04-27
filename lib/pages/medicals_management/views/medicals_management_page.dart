import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/controllers/navigation_controller.dart';
import 'package:kalam_noor/pages/medicals_management/views/widgets/medicals_menu_list_tile.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';

class MedicalsManagementPage extends StatelessWidget {
  const MedicalsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'إدارة الشؤون الصحية',
        iconData: FontAwesomeIcons.syringe,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalsMenuListTile(
                title: 'اللقاحات',
                //TODO: Come up with a good desc
                subtitle: 'اللقاحات اللقاحات اللقاحات',
                iconData: FontAwesomeIcons.syringe,
                onTap: () => NavigationController.toVaccinesManagementPage(),
              ),
              MedicalsMenuListTile(
                title: 'الأمراض',
                //TODO: Come up with a good desc
                subtitle: ' اللقاحات اللقاحات اللقاحات',
                iconData: FontAwesomeIcons.virus,
                onTap: () => NavigationController.toIllnessesManagementPage(),
              ),
              MedicalsMenuListTile(
                title: 'الحالات المزاجية',
                //TODO: Come up with a good desc
                subtitle: ' اللقاحات اللقاحات اللقاحات',
                iconData: FontAwesomeIcons.faceMehBlank,
                onTap: () => NavigationController
                    .toPsychologicalStatusesManagementPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

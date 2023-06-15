import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';
import '../../../../../configs/fonts.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/settings_page_controller.dart';

class ProfileAddress extends StatelessWidget {
  const ProfileAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsPageController controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "يسكن في ",
          style: ProjectFonts.headlineSmall().copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        FutureBuilder(
          future: controller.getEmployeeAddressInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            if (snapshot.hasError) {
              return const ErrorLoadingSomethingWidget(
                  somethingName: "العنوان");
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SettingsPageAddressInfoSubCard(
                  title: snapshot.data!.city.name,
                  iconData: FontAwesomeIcons.city,
                ),
                const Icon(Icons.chevron_right),
                SettingsPageAddressInfoSubCard(
                  title: snapshot.data!.area.name,
                  iconData: FontAwesomeIcons.treeCity,
                ),
                const Icon(Icons.chevron_right),
                SettingsPageAddressInfoSubCard(
                  title: snapshot.data!.address.name,
                  iconData: FontAwesomeIcons.road,
                  details: snapshot.data!.address.details,
                ),
              ],
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}

class SettingsPageAddressInfoSubCard extends StatelessWidget {
  const SettingsPageAddressInfoSubCard({
    super.key,
    required this.title,
    required this.iconData,
    this.details,
  });

  final String title;
  final IconData iconData;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: details != null && details != '-' ? details : title,
        child: Column(
          children: [
            FaIcon(
              iconData,
              color: Get.theme.colorScheme.primary,
              size: 50.sp,
            ),
            AddVerticalSpacing(value: 30.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ProjectFonts.headlineSmall().copyWith(
                color: Get.theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

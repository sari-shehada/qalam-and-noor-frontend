import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import 'package:kalam_noor/pages/vaccines_management_page/views/widgets/vaccines_table.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import '../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../tools/ui_tools/labeled_widget.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import '../controllers/vaccines_management_controller.dart';

class VaccinesManagementPage extends StatelessWidget {
  const VaccinesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    VaccinesManagementController vaccinesManagementController =
        Get.put(VaccinesManagementController());
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        height: 74.h,
        width: 300.w,
        onTap: () => vaccinesManagementController.addNewVaccine(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة لقاح جديد',
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
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: "إدارة اللقاحات",
        iconData: FontAwesomeIcons.syringe,
        backButtonEnabled: true,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: textTheme.titleLarge,
            ),
            AddHorizontalSpacing(value: 25.w),
            CustomDropDownButton(
              backgroundColor: colorScheme.primaryContainer,
              dropdownColor: colorScheme.primaryContainer,
              value: vaccinesManagementController.currentSortingOption,
              items: VaccinesSortingOption.values
                  .map((e) => DropdownMenuItem<VaccinesSortingOption>(
                      value: e,
                      child: Text(vaccinesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (VaccinesSortingOption? value) =>
                  vaccinesManagementController.changeSortingOption(value),
            ),
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: LabeledWidget(
              label: 'اللقاحات الحالية',
              labelTextStyle: TextStyle(
                fontSize: 30.sp,
              ),
              spacing: 35.h,
              child: Obx(() {
                return FutureBuilder<RxList<Vaccine>>(
                  future: vaccinesManagementController.vaccines.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LoaderWidget(),
                      );
                    }
                    if (snapshot.hasError) {
                      //TODO: Change later
                      return const Center(
                        child: Text('error loading vaccines'),
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const EmptyItemWidget(
                          itemName: 'لقاحات',
                          iconData: FontAwesomeIcons.syringe,
                        );
                      } else {
                        RxList<Vaccine> vaccines =
                            snapshot.data as RxList<Vaccine>;
                        return Expanded(
                          child: VaccinesTable(vaccines: vaccines),
                        );
                      }
                    } else {
                      return const EmptyItemWidget(
                        itemName: 'لقاحات',
                        iconData: FontAwesomeIcons.syringe,
                      );
                    }
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
/*class VaccinesManagementPage extends StatelessWidget {
  const VaccinesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    VaccinesManagementController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'اللقاحات',
        iconData: FontAwesomeIcons.syringe,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: FutureBuilder(
          future: controller.vaccines,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const EmptyItemWidget(
                        itemName: 'لقاحات',
                        iconData: FontAwesomeIcons.syringe,
                      );
                    }
                    List<Vaccine> vaccines = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      itemCount: vaccines.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.w,
                        mainAxisSpacing: 20.w,
                        // mainAxisExtent: 50.h,
                        childAspectRatio: 7,
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          //TODO:
                          onTap: () {},
                          title: Text(vaccines[index].name),
                          trailing: Icon(
                            Icons.edit,
                          ),
                        );
                      },
                    );
                  }
                  return const EmptyItemWidget(
                    itemName: 'لقاحات',
                    iconData: FontAwesomeIcons.syringe,
                  );
                }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}*/

// class VaccinesManagementPage extends StatelessWidget {
//   const VaccinesManagementPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'اللقاحات',
//         iconData: FontAwesomeIcons.syringe,
//       ),
//       body: SizedBox.expand(
//         child: FutureBuilder(builder:
//         ),
//       ),
//     );
//   }
// }

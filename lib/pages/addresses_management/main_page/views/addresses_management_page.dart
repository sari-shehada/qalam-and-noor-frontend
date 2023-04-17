import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/custom_drop_down_menu.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import '../../../../models/address/city.dart';
import '../controllers/address_management_controller.dart';

import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import 'widgets/cities_table.dart';

//TODO: Consider adding some statistics in spare time
//as well as moving current cities to a separate page to make up space for stats
class AddressesManagementPage extends StatelessWidget {
  const AddressesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressManagementController addressManagementController = Get.put(
      AddressManagementController(),
    );
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => addressManagementController.addNewCity(),
        height: 74.h,
        width: 300.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة مدينة جديدة',
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
                )
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: 'إدارة العناوين',
        iconData: FontAwesomeIcons.locationDot,
        appBarBoxDecoration: const BoxDecoration(
            // color: Colors.white,
            ),
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
              value: addressManagementController.currentSortingOption,
              items: CitiesSortingOption.values
                  .map((e) => DropdownMenuItem<CitiesSortingOption>(
                      value: e, child: Text(citiesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (CitiesSortingOption? value) =>
                  addressManagementController.changeSortingOption(value),
            )
          ],
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10.h),
                            blurRadius: 10,
                            color: colorScheme.shadow.withOpacity(.03),
                          )
                        ],
                      ),
                    ),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10.h),
                            blurRadius: 10,
                            color: colorScheme.shadow.withOpacity(.03),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(value: 40.h),
            Expanded(
              flex: 70,
              child: LabeledWidget(
                label: 'المدن الحالية',
                labelTextStyle: TextStyle(
                  fontSize: 25.sp,
                ),
                spacing: 35.h,
                child: Obx(() {
                  return FutureBuilder<RxList<City>>(
                    future: addressManagementController.cities.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        //TODO: Change later
                        return const Center(
                          child: Text('error loading addresses'),
                        );
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const EmptyItemWidget(
                            itemName: 'مدن',
                            iconData: FontAwesomeIcons.locationArrow,
                          );
                        } else {
                          RxList<City> cities = snapshot.data as RxList<City>;
                          return Expanded(
                            child: CitiesTable(
                              cities: cities,
                            ),
                          );
                        }
                      } else {
                        return const EmptyItemWidget(
                          itemName: 'مدن',
                          iconData: FontAwesomeIcons.locationArrow,
                        );
                      }
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

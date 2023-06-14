import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../configs/styles.dart';
import '../controllers/addresses_management_stats_controller.dart';
import 'widgets/cities_to_descendent_count_pie_chart.dart';
import 'widgets/numeric_stats_widget.dart';
import '../../../../../tools/ui_tools/custom_drop_down_menu.dart';
import '../../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../tools/widgets/error_loading_something_widget.dart';
import '../../../../../models/address/city.dart';
import '../../../../../tools/ui_tools/labeled_widget.dart';
import '../controllers/address_management_controller.dart';

import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/custom_appbar.dart';
import 'widgets/cities_table.dart';

class AddressesManagementPage extends StatelessWidget {
  const AddressesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressManagementController addressManagementController = Get.put(
      AddressManagementController(),
    );
    AddressesManagementStatsController statsController = Get.put(
      AddressesManagementStatsController(),
    );
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    final BoxDecoration statsContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10.h),
          blurRadius: 10,
          color: colorScheme.shadow.withOpacity(.02),
        )
      ],
    );
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
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      decoration: statsContainerDecoration,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.h, horizontal: 20.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: AddressesManagementNumericStatsWidget(
                                future: statsController.citiesCount,
                                label: 'مدينة',
                                color: GlobalStyles.miscColors[0],
                              ),
                            ),
                            VerticalDivider(
                              indent: 20.h,
                              width: 1.w,
                              endIndent: 25.h,
                            ),
                            Expanded(
                              child: AddressesManagementNumericStatsWidget(
                                future: statsController.areasCount,
                                label: 'حي',
                                color: GlobalStyles.miscColors[1],
                              ),
                            ),
                            VerticalDivider(
                              indent: 20.h,
                              width: 1.w,
                              endIndent: 25.h,
                            ),
                            Expanded(
                              child: AddressesManagementNumericStatsWidget(
                                future: statsController.addressesCount,
                                label: 'عنوان',
                                color: GlobalStyles.miscColors[2],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: statsContainerDecoration,
                      child: LargestCitiesByDescendentCountPieChart(
                        legendTitle: 'أكبر المدن من حيث عدد المناطق',
                        future: statsController.citiesToAreasCount,
                        onFailedToLoadText: 'تعذر بناء إحصائيات عدد المناطق',
                      ),
                    ),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: statsContainerDecoration,
                      child: LargestCitiesByDescendentCountPieChart(
                        legendTitle: 'أكبر المدن من حيث عدد العناوين',
                        future: statsController.citiesToAddressesCount,
                        onFailedToLoadText: 'تعذر بناء إحصائيات عدد العناوين',
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
                  fontSize: 30.sp,
                ),
                spacing: 35.h,
                child: Obx(() {
                  return FutureBuilder<RxList<City>>(
                    future: addressManagementController.cities.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: LoaderWidget(),
                        );
                      }
                      if (snapshot.hasError) {
                        return ErrorLoadingSomethingWidget(
                          somethingName: 'مدن',
                          retryCallback: () =>
                              addressManagementController.refreshCities(),
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

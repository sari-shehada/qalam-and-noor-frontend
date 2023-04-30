import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/tools/ui_tools/custom_drop_down_menu.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import '../../../../models/address/area.dart';
import '../../../../tools/ui_tools/ui_tools.dart';
import '../../main_page/controllers/address_management_controller.dart';
import '../controllers/city_details_controller.dart';
import 'widgets/area_card.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';

class CityDetailsPage extends StatelessWidget {
  const CityDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    final CityDetailsController cityDetailsController = Get.find();
    return CustomScaffold(
      floatingActionButton: CustomFilledButton(
        onTap: () => cityDetailsController.addNewArea(),
        height: 74.h,
        width: 300.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة منطقة جديدة',
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
      bodyPadding: EdgeInsetsDirectional.only(
        top: 20.h,
        start: 60.w,
        end: 60.w,
      ),
      appBar: CustomAppBar(
        title: cityDetailsController.city.name,
        iconData: FontAwesomeIcons.locationDot,
        backButtonEnabled: true,
        actionButton: Row(
          children: [
            Text(
              'ترتيب حسب:',
              style: textTheme.titleLarge,
            ),
            AddHorizontalSpacing(value: 25.w),
            CustomDropDownButton<CitiesSortingOption>(
              dropdownColor: colorScheme.primaryContainer,
              textStyle: textTheme.titleMedium,
              backgroundColor: colorScheme.primaryContainer,
              value: cityDetailsController.currentSortingOption,
              items: CitiesSortingOption.values
                  .map((e) => DropdownMenuItem<CitiesSortingOption>(
                      value: e, child: Text(citiesSortingOptionsAsString[e]!)))
                  .toList(),
              onChanged: (CitiesSortingOption? value) =>
                  cityDetailsController.changeSortingOption(value),
            ),
          ],
        ),
      ),
      body: Obx(
        () => FutureBuilder(
          future: cityDetailsController.areas.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                //TODO: Change later
                child: Text('Error Loading Areas'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                  itemName: 'احياء',
                  iconData: FontAwesomeIcons.mapLocationDot,
                );
              } else {
                List<Area> areas = snapshot.data as List<Area>;
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: areas.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 90.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context, index) => AreaCard(
                    area: areas[index],
                  ),
                );
              }
            } else {
              return const EmptyItemWidget(
                itemName: 'مناطق',
                iconData: FontAwesomeIcons.mapLocation,
              );
            }
          },
        ),
      ),
    );
  }
}

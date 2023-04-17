import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../controllers/add_address_page_controller.dart';
import '../../tools/ui_tools/ui_tools.dart';

import '../../tools/ui_tools/buttons.dart';
import '../../tools/ui_tools/drop_down_menu.dart';
import '../../tools/ui_tools/text_fields.dart';

class AddOrEditAddressDialog extends StatelessWidget {
  const AddOrEditAddressDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;
    AddAddressPageController addAddressPageController =
        Get.put(AddAddressPageController());
    const double dropdownMenuWidth = 818;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50.h),
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
        width: 900.w,
        height: 700.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 80.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.all(12.w),
                  icon: FaIcon(
                    FontAwesomeIcons.x,
                    size: 24.sp,
                  ),
                ),
                AddHorizontalSpacing(value: 20.w),
                Text(
                  'إضافة عنوان',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Obx(
            () {
              if (addAddressPageController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'المدينة',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: colorScheme.primary,
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  CustomDropDownMenu(
                    width: dropdownMenuWidth,
                    controller: addAddressPageController.cityController,
                    dropdownMenuEntries: dummyCities
                        .map(
                          (item) => DropdownMenuEntry(
                            value: item.id,
                            label: item.name,
                          ),
                        )
                        .toList(),
                    onSelected: (int? cityId) =>
                        addAddressPageController.selectCity(cityId),
                  ),
                  AddVerticalSpacing(value: 30.h),
                  Text(
                    'المنطقة',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: colorScheme.primary,
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  Obx(
                    () {
                      return CustomDropDownMenu(
                        width: dropdownMenuWidth,
                        controller: addAddressPageController.areaController,
                        initialSelection:
                            addAddressPageController.selectedAreaId,
                        enabled: addAddressPageController
                            .areaDropdownListEnabled.value,
                        dropdownMenuEntries:
                            addAddressPageController.areasItems,
                        onSelected: (areaId) =>
                            addAddressPageController.selectArea(areaId),
                      );
                    },
                  ),
                  AddVerticalSpacing(value: 30.h),
                  Text(
                    'العنوان',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: colorScheme.primary,
                    ),
                  ),
                  AddVerticalSpacing(value: 20.h),
                  HintedTextField(
                    controller: addAddressPageController.addressController,
                    hintText: '',
                  ),
                  AddVerticalSpacing(value: 40.h),
                  CustomFilledButton(
                    buttonStatus: addAddressPageController.buttonStatus,
                    onTap: () => addAddressPageController.addAddress(),
                    child: Text(
                      'اضافة عنوان',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

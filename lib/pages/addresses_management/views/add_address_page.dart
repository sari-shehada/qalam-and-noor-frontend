import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/dummy_data.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/pages/addresses_management/controllers/add_address_page_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class AddOrEditAddressPage extends StatelessWidget {
  const AddOrEditAddressPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;
    AddAddressPageController addAddressPageController = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          180.h,
        ),
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70.w,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                    ),
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  Text(
                    'اضافة عنوان جديد',
                    style: TextStyle(
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(60.w),
        child: Center(
          child: Container(
            // width: MediaQuery.of(context).size.width * .45,
            height: 700,
            padding: EdgeInsets.symmetric(
              vertical: 40.h,
              horizontal: 50.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                14.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF393939).withOpacity(.06),
                  blurRadius: 60,
                  offset: Offset(0.w, 30.h),
                ),
              ],
            ),
            child: Obx(() {
              if (addAddressPageController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    () => CustomDropDownMenu(
                      enabled: addAddressPageController
                          .areaDropdownListEnabled.value,
                      dropdownMenuEntries: addAddressPageController.areasInCity
                          .map(
                            (item) => DropdownMenuEntry(
                              value: item.id,
                              label: item.name,
                            ),
                          )
                          .toList(),
                      onSelected: (areaId) =>
                          addAddressPageController.selectArea(areaId),
                    ),
                  ),
                  AddVerticalSpacing(value: 30.h),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    this.width = 750,
    this.controller,
    this.enabled = true,
    required this.dropdownMenuEntries,
    required this.onSelected,
  });

  final double width;
  final bool enabled;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T? item)? onSelected;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: width.w,
      dropdownMenuEntries: dropdownMenuEntries,
      onSelected: onSelected,
      enabled: enabled,
      controller: controller,
    );
  }
}

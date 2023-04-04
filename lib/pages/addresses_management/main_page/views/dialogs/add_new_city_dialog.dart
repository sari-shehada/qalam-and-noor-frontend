import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';

import '../../../../../dummy_data.dart';
import '../../../../../models/address/city.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class AddNewCityDialog extends StatelessWidget {
  const AddNewCityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewCityController addNewCityController = Get.put(AddNewCityController());
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
        width: 700.w,
        height: 320.h,
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
                  'إضافة مدينة',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddVerticalSpacing(value: 30.h),
              HintedTextField(
                hintText: 'اسم المدينة',
                controller: addNewCityController.cityController,
              ),
              AddVerticalSpacing(value: 30.h),
              CallToActionButton(
                onTap: () => addNewCityController.addCity(),
                child: 'اضافة مدينة',
              ),
              AddVerticalSpacing(value: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewCityController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  Rx<CallToActionButtonStatus> buttonStatus =
      (CallToActionButtonStatus.enabled).obs;

  bool validateFields() {
    if (cityController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم مدينة فارغ', message: 'الرجاء ملء حقل اسم المدينة');
      return false;
    }
    return true;
  }

  Future<void> addCity() async {
    try {
      buttonStatus.value = CallToActionButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      City city = City(id: (dummyCities.length + 1), name: cityController.text);
      print(city.id);
      await DatabaseHelper.addCity(city);
      Get.back(result: true);
    } catch (e) {
    } finally {
      buttonStatus.value = CallToActionButtonStatus.enabled;
    }
  }
}

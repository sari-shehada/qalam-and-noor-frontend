// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:kalam_noor/models/address/area.dart';

import '../../../../../models/helpers/database_helper.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class AddNewAreaDialog extends StatelessWidget {
  const AddNewAreaDialog({
    super.key,
    required this.cityId,
  });

  final int cityId;
  @override
  Widget build(BuildContext context) {
    AddNewAreaController addNewAreaController = Get.put(
      AddNewAreaController(cityId: cityId),
    );
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
                  'إضافة منطقة',
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
                hintText: 'اسم المنطقة',
                controller: addNewAreaController.areaController,
              ),
              AddVerticalSpacing(value: 30.h),
              CallToActionButton(
                onTap: () => addNewAreaController.addArea(),
                child: 'اضافة منطقة',
              ),
              AddVerticalSpacing(value: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewAreaController extends GetxController {
  final TextEditingController areaController = TextEditingController();
  final Rx<CallToActionButtonStatus> buttonStatus =
      (CallToActionButtonStatus.enabled).obs;

  final int cityId;
  AddNewAreaController({
    required this.cityId,
  });

  bool validateFields() {
    if (areaController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم منطقة فارغ', message: 'الرجاء ملء حقل اسم المنطقة');
      return false;
    }
    return true;
  }

  Future<void> addArea() async {
    try {
      buttonStatus.value = CallToActionButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Area area = Area(id: -1, name: areaController.text, cityId: cityId);
      await DatabaseHelper.addNewArea(area);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CallToActionButtonStatus.enabled;
    }
  }
}

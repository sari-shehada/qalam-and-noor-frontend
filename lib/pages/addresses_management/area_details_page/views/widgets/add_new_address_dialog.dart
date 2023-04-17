// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/address.dart';

import '../../../../../models/helpers/database_helper.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';
import '../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';

class AddNewAddressDialog extends StatelessWidget {
  const AddNewAddressDialog({
    super.key,
    required this.areaId,
  });

  final int areaId;
  @override
  Widget build(BuildContext context) {
    AddNewAddressController controller = Get.put(
      AddNewAddressController(areaId: areaId),
    );
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
        width: 700.w,
        height: 420.h,
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
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddVerticalSpacing(value: 30.h),
              HintedTextField(
                hintText: 'اسم العنوان',
                controller: controller.addressController,
              ),
              AddVerticalSpacing(value: 30.h),
              HintedTextField(
                hintText: 'تفاصيل إضافية (اختياري)',
                controller: controller.detailsController,
              ),
              AddVerticalSpacing(value: 30.h),
              CustomFilledButton(
                onTap: () => controller.addAddress(),
                child: 'اضافة عنوان',
              ),
              AddVerticalSpacing(value: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewAddressController extends GetxController {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final Rx<CustomButtonStatus> buttonStatus = (CustomButtonStatus.enabled).obs;

  final int areaId;
  AddNewAddressController({
    required this.areaId,
  });

  bool validateFields() {
    if (addressController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
          title: 'اسم عنوان فارغ', message: 'الرجاء ملء حقل اسم العنوان');
      return false;
    }
    return true;
  }

  Future<void> addAddress() async {
    try {
      buttonStatus.value = CustomButtonStatus.processing;
      if (validateFields() == false) {
        return;
      }
      Address address = Address(
          id: -1,
          name: addressController.text,
          details: detailsController.text == '' ? null : detailsController.text,
          areaId: areaId);
      await DatabaseHelper.addNewAddress(address);
      Get.back(result: true);
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}

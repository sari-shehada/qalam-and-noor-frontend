import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../../../tools/ui_tools/buttons.dart';

class StudentFamilyInfoDialogController extends GetxController {
  Rx<CustomButtonStatus> searchButtonStatus = CustomButtonStatus.enabled.obs;
  TextEditingController tieNumberEditingController = TextEditingController();
  Rx<List<Family>?> familySearchResult = Rx<List<Family>?>(null);
  RxDouble initialDialogSize = 220.h.obs;
  Future<void> applySearch() async {
    if (tieNumberEditingController.text.isEmpty) {
      SnackbarService.showErrorSnackBar(
        title: 'حدث خطأ',
        message: 'الرجاء ادخال رقم قيد',
      );
      return;
    }

    int parsedSearchValue = int.parse(tieNumberEditingController.text);
    //TODO: Dispose, Use somwhere else

    // if (parsedSearchValue < 1) {
    //   SnackbarService.showErrorSnackBar(
    //     title: 'حدث خطأ',
    //     message: 'لا يمكن ان يكون رقم الثيد سالب',
    //   );
    //   return;
    // }
    await _getSearchData(parsedSearchValue);
  }

  Future<void> _getSearchData(int data) async {
    familySearchResult.value = null;
    initialDialogSize.value = 220.h;
    searchButtonStatus.value = CustomButtonStatus.processing;
    familySearchResult.value =
        await DatabaseHelper.getFamiliesByTieNumber(tieNumber: data);
    initialDialogSize.value += 400.h; //Container Size
    searchButtonStatus.value = CustomButtonStatus.enabled;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/families.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/helpers/database_helper.dart';
import 'package:kalam_noor/pages/new_student_registration/family_information/models/family_info.dart';
import 'package:kalam_noor/tools/dialogs_services/snack_bar_service.dart';

import '../../../../../tools/ui_tools/buttons.dart';
import '../../views/dialogs/add_student_family_info_dialog.dart';

class StudentFamilyInfoDialogController extends GetxController {
  Rx<CustomButtonStatus> searchButtonStatus = CustomButtonStatus.enabled.obs;
  TextEditingController tieNumberEditingController = TextEditingController();
  Rx<List<FamilyInfo>?> familySearchResult = Rx<List<FamilyInfo>?>(null);
  RxDouble initialDialogSize =
      StudentFamilyDialogConstants.collapsedDialogHeight.obs;
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
    initialDialogSize.value =
        StudentFamilyDialogConstants.collapsedDialogHeight.h;
    searchButtonStatus.value = CustomButtonStatus.processing;
    List<Family> families =
        await DatabaseHelper.getFamiliesByTieNumber(tieNumber: data);
    familySearchResult.value = [];
    for (Family family in families) {
      {
        Father father =
            await DatabaseHelper.getFatherByFamilyId(familyId: family.id);
        Mother mother =
            await DatabaseHelper.getMotherByFamilyId(familyId: family.id);
        familySearchResult.value!
            .add(FamilyInfo(family: family, father: father, mother: mother));
      }
    }
    if (familySearchResult.value!.isEmpty) {
      initialDialogSize.value +=
          StudentFamilyDialogConstants.noSearchResultCardHeight;
    }
    initialDialogSize.value +=
        StudentFamilyDialogConstants.searchResultCardHeight *
                familySearchResult.value!.length +
            50.h;
    searchButtonStatus.value = CustomButtonStatus.enabled;
  }

  Future<void> addFamilyInfo() async {
    var result = await Get.dialog(const AddStudentFamilyInfoDialog());
    if (result is FamilyInfo) {
      Get.back(result: result);
    }
  }
}

abstract class StudentFamilyDialogConstants {
  static double get collapsedDialogHeight => 225.h;
  static double get expandedDialogHeight => 800.h;
  static double get searchResultCardHeight => 150.h;
  static double get noSearchResultCardHeight => 200.h;
}

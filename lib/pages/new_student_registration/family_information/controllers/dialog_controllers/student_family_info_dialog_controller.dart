import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/family.dart';
import 'package:kalam_noor/models/agendas/father.dart';
import 'package:kalam_noor/models/agendas/mother.dart';
import 'package:kalam_noor/models/helpers/database_helpers/father_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/mother_db_helper.dart';
import 'package:kalam_noor/models/helpers/database_helpers/families_db_helper.dart';
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
      SnackBarService.showErrorSnackBar(
        title: 'حدث خطأ',
        message: 'الرجاء ادخال رقم قيد',
      );
      return;
    }

    int parsedSearchValue = int.parse(tieNumberEditingController.text);
    await _getSearchData(parsedSearchValue);
  }

  Future<void> _getSearchData(int data) async {
    familySearchResult.value = null;
    initialDialogSize.value =
        StudentFamilyDialogConstants.collapsedDialogHeight.h;
    searchButtonStatus.value = CustomButtonStatus.processing;
    List<Family> families =
        await FamiliesDBHelper.instance.getByFatherTieNumber(
      //TODO:
      tieNumber: data.toString(),
    );
    familySearchResult.value = [];
    for (Family family in families) {
      {
        Father? father = await FatherDBhelper.instance.getById(family.fatherId);
        Mother? mother = await MotherDBHelper.instance.getById(family.motherId);
        if (father == null || mother == null) {
          //TODO: Describe the issue
          throw Exception();
        }
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

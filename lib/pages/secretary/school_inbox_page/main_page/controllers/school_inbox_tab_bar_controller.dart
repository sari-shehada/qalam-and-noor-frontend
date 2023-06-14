import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolInboxTabBarController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt pageIndex = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
      () {
        pageIndex.value = tabController.index;
      },
    );
    super.onInit();
  }
}

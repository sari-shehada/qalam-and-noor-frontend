import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/school_inbox_tab_bar_controller.dart';

import 'school_inbox_tabbar_item.dart';

class SchoolInboxTabBar extends GetView<SchoolInboxTabBarController> {
  const SchoolInboxTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      tabs: [
        SchoolInboxTabBarItem(
          title: 'المحادثات المفتوحة',
          currentIndex: controller.pageIndex,
          itemIndex: 0,
        ),
        SchoolInboxTabBarItem(
          title: 'المحادثات المغلقة',
          currentIndex: controller.pageIndex,
          itemIndex: 1,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/conversations/conversation.dart';

import '../views/school_inbox_page.dart';

class SchoolInboxController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt pageIndex = 0.obs;
  late Rx<Future<List<Conversation>>> conversations;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
      () {
        pageIndex.value = tabController.index;
      },
    );
    conversations = getConversations().obs;
    super.onInit();
  }

  Future<List<Conversation>> getConversations() async {
    await Future.delayed(3.seconds);
    return await getCurrentConversations();
  }
}

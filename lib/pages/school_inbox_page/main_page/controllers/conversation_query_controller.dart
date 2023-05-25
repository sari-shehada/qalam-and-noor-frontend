import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/pages/school_inbox_page/conversation_body/models/conversation_query.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/school_inbox_tab_bar_controller.dart';

class ConversationQueryController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  Rx<ConversationQuery> query = Rx<ConversationQuery>(
    ConversationQuery(
      studentNameOrId: '',
      conversationStatus: ConversationStatus.open,
      studentSearchQueryType: StudentSearchQueryType.none,
    ),
  );

  @override
  void onInit() {
    Get.find<SchoolInboxTabBarController>().tabController.addListener(() {
      query.value = query.value.copyWith(
          conversationStatus: ConversationStatus.values[
              Get.find<SchoolInboxTabBarController>().tabController.index]);
    });
    super.onInit();
  }

  updateQuery() {
    if (searchFieldController.text.isEmpty) {
      query.value = query.value.copyWith(
        studentSearchQueryType: StudentSearchQueryType.none,
        studentNameOrId: '',
      );
      return;
    }
    if (searchFieldController.text.isNumericOnly) {
      query.value = query.value.copyWith(
        studentSearchQueryType: StudentSearchQueryType.publicRecordId,
        studentNameOrId: searchFieldController.text,
      );
      return;
    }
    query.value = query.value.copyWith(
      studentSearchQueryType: StudentSearchQueryType.name,
      studentNameOrId: searchFieldController.text,
    );
  }

  resetSearchField() {
    searchFieldController.text = '';
    updateQuery();
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:kalam_noor/models/conversations/web_conversation.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_fetching_controller.dart';

class ConversationBodyController extends GetxController {
  Rx<WebConversation?> currentConversation = Rx<WebConversation?>(null);
  // late Timer messagesRefreshTimer;
  @override
  void onInit() {
    Get.find<ConversationFetchingController>()
        .conversationListStatus
        .stream
        .listen((event) {
      if (event == ConversationListStatus.isLoading) {
        //TODO: reset
        currentConversation.value = null;
      }
    });
    super.onInit();
  }

  void selectConversation(WebConversation webConversation) {
    currentConversation.value = webConversation;
  }

  void resetConversation() {
    // messagesRefreshTimer.cancel();
  }
}

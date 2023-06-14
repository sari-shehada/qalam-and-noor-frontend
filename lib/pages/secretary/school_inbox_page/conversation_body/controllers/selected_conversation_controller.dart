import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/main_page/controllers/conversation_fetching_controller.dart';

import '../../../../../models/conversations/web_conversation.dart';

class SelectedConversationController extends GetxController {
  Rx<WebConversation?> currentConversation = Rx<WebConversation?>(null);

  @override
  void onInit() {
    Get.find<ConversationFetchingController>()
        .conversationListStatus
        .stream
        .listen((event) {
      if (event == ConversationListStatus.isLoading) {
        resetConvo();
      }
    });
    super.onInit();
  }

  void reselectConvo(WebConversation conversation) {
    resetConvo();
    currentConversation.value = conversation;
  }

  void selectConversation(WebConversation webConversation) {
    if (currentConversation.value == null) {
      currentConversation.value = webConversation;
    } else {
      if (webConversation.id == currentConversation.value!.id) {
        return;
      }
      reselectConvo(webConversation);
    }
  }

  resetConvo() {
    currentConversation.value = null;
  }
}

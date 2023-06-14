import 'dart:async';

import 'package:get/get.dart';
import '../../../../../models/conversations/message.dart';
import '../../../../../models/helpers/database_helpers/messages_db_helper.dart';
import 'selected_conversation_controller.dart';
import '../../main_page/controllers/conversation_fetching_controller.dart';

class ConversationBodyController extends GetxController {
  late int currentConvoId;
  Rx<ConversationMessagesStatus> conversationMessagesStatus =
      ConversationMessagesStatus.isLoading.obs;
  RxList<Message> conversationMessages = <Message>[].obs;
  late Timer refreshMessagesTimer;
  @override
  void onInit() {
    refreshMessagesTimer = Timer.periodic(1.seconds, (timer) {
      updateMessages();
    });
    refreshMessagesTimer.cancel();
    Get.find<ConversationFetchingController>()
        .conversationListStatus
        .stream
        .listen((event) {
      if (event == ConversationListStatus.isLoading) {
        resetTimerAndMessages();
      }
    });
    Get.find<SelectedConversationController>()
        .currentConversation
        .stream
        .listen(
      (event) {
        if (event != null) {
          currentConvoId = Get.find<SelectedConversationController>()
              .currentConversation
              .value!
              .id;
          getMessages();
        } else {
          resetTimerAndMessages();
        }
      },
    );
    super.onInit();
  }

  getMessages() async {
    conversationMessagesStatus.value = ConversationMessagesStatus.isLoading;
    conversationMessages.value = await fetchMessages();
    initializeTimer();
  }

  updateMessages() async {
    refreshMessagesTimer.cancel();
    int tempCurrentConvoId = currentConvoId;
    List<Message> tempMessages = await fetchMessages();
    if (Get.find<SelectedConversationController>().currentConversation.value !=
        null) {
      if (tempCurrentConvoId ==
          Get.find<SelectedConversationController>()
              .currentConversation
              .value!
              .id) {
        conversationMessages.value = tempMessages;
      }
    }
    initializeTimer();
  }

  Future<List<Message>> fetchMessages() async {
    try {
      List<Message> tempMessages =
          await MessagesDBHelper.instance.getByConversationId(currentConvoId);
      conversationMessagesStatus.value = ConversationMessagesStatus.hasMessages;
      return tempMessages;
    } catch (e) {
      conversationMessagesStatus.value = ConversationMessagesStatus.hasError;
      return [];
    }
  }

  resetTimerAndMessages() {
    conversationMessagesStatus.value = ConversationMessagesStatus.isLoading;
    conversationMessages.clear();
    refreshMessagesTimer.cancel();
    // if (refreshMessagesTimer.isActive) {
    // }
  }

  initializeTimer() {
    if (refreshMessagesTimer.isActive) {
      return;
    }
    refreshMessagesTimer = Timer.periodic(500.milliseconds, (timer) {
      updateMessages();
    });
  }

  @override
  void onClose() {
    refreshMessagesTimer.cancel();
    super.onClose();
  }
}

enum ConversationMessagesStatus {
  isLoading,
  hasMessages,
  hasError,
}

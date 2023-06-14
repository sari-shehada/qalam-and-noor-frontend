import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/conversations/conversation.dart';
import '../../../../../models/conversations/message.dart';
import '../../../../../models/conversations/web_conversation.dart';
import '../../../../../models/enums.dart';
import '../../../../../models/helpers/database_helpers/conversations_db_helper.dart';
import '../../../../../models/helpers/database_helpers/messages_db_helper.dart';
import 'selected_conversation_controller.dart';
import '../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../tools/ui_tools/buttons.dart';

class ConversationCommunicationController extends GetxController {
  late int currentConvoId;
  final ScrollController scrollController = ScrollController();
  TextEditingController messageBodyController = TextEditingController();
  Rx<CustomButtonStatus> sendButtonStatus = CustomButtonStatus.enabled.obs;
  ContextMenuController contextMenuController = ContextMenuController();
  @override
  void onInit() {
    Get.find<SelectedConversationController>()
        .currentConversation
        .stream
        .listen((event) {
      messageBodyController.text = '';
      currentConvoId = event?.id ?? -1;
    });
    super.onInit();
  }

  void selectContextMenuItem(ConversationBodyContextMenuOptions option) {
    switch (option) {
      case ConversationBodyContextMenuOptions.displayStudentProfile:
        {
          return;
        }
      case ConversationBodyContextMenuOptions.endConversation:
        {
          endCurrentConversation();
        }
    }
  }

  Future<void> endCurrentConversation() async {
    SelectedConversationController selectedConversationController =
        Get.find<SelectedConversationController>();
    WebConversation webConversation =
        selectedConversationController.currentConversation.value!;
    final Conversation conversation = Conversation(
      id: webConversation.id,
      studentId: webConversation.studentId,
      title: webConversation.title,
      status: ConversationStatus.closed,
      originalIssuer: webConversation.orginalIssuer,
    );
    await ConversationsDBHelper.instance.update(conversation);
    SnackBarService.showSuccessSnackBar(
      title: 'تمت العملية بنجاح',
      message:
          'تم بنجاح انهاء المحادثة ذات العنوان ${conversation.title} المتعلقة بالطالب ${webConversation.studentName}',
    );
    selectedConversationController.resetConvo();
  }

  void sendMessageToCurrentConversation() async {
    if (currentConvoId == -1 || messageBodyController.text.isEmpty) {
      return;
    }
    sendButtonStatus.value = CustomButtonStatus.processing;
    await MessagesDBHelper.instance.insert(
      Message(
          id: -1,
          body: messageBodyController.text,
          sender: ConversationParty.secretKeeper,
          date: DateTime.now(),
          conversationId: currentConvoId),
    );
    messageBodyController.text = '';
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: 500.milliseconds, curve: Curves.linearToEaseOut);
    SnackBarService.showSuccessSnackBar(
      title: 'تم الارسال',
      message: 'تم ارسال الرسالة بنجاح',
    );
    sendButtonStatus.value = CustomButtonStatus.enabled;
  }
}

enum ConversationBodyContextMenuOptions {
  endConversation,
  displayStudentProfile,
}

Map<ConversationBodyContextMenuOptions, String>
    conversationBodyContextMenuOptionsAsString = {
  ConversationBodyContextMenuOptions.endConversation: 'إنهاء المحادثة',
  ConversationBodyContextMenuOptions.displayStudentProfile:
      'عرض الملف الشخصي للطالب',
};

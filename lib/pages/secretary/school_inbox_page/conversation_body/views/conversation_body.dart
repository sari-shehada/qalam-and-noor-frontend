import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/selected_conversation_controller.dart';
import 'widgets/conversation_list_widget.dart';
import 'widgets/no_conversation_yet_page.dart';

class ConversationBodyWidget extends GetView<SelectedConversationController> {
  const ConversationBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.currentConversation.value != null) {
        return const ConversationListWidget();
      }
      return const NoConversationYetSubPage();
    });
  }
}

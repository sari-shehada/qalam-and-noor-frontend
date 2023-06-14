import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/conversation_body/controllers/selected_conversation_controller.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/conversation_body/views/widgets/conversation_list_widget.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/conversation_body/views/widgets/no_conversation_yet_page.dart';

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

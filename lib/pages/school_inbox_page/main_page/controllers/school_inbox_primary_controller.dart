import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_fetching_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_query_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/school_inbox_tab_bar_controller.dart';

import '../../conversation_body/controllers/conversation_body_controller.dart';
import '../../conversation_body/controllers/conversation_communication_controller.dart';
import '../../conversation_body/controllers/selected_conversation_controller.dart';

class SchoolInboxPrimaryController extends GetxController {
  late SchoolInboxTabBarController schoolInboxTabBarController;
  late ConversationQueryController queryController;
  late ConversationFetchingController conversationFetchingController;
  late SelectedConversationController selectedConversationController;
  late ConversationBodyController conversationBodyController;
  late ConversationCommunicationController conversationCommunicationController;
  @override
  void onInit() {
    schoolInboxTabBarController = Get.put(SchoolInboxTabBarController());
    queryController = Get.put(ConversationQueryController());
    conversationFetchingController = Get.put(ConversationFetchingController());
    selectedConversationController = Get.put(SelectedConversationController());
    conversationBodyController = Get.put(ConversationBodyController());
    conversationCommunicationController =
        Get.put(ConversationCommunicationController());
    super.onInit();
  }
}

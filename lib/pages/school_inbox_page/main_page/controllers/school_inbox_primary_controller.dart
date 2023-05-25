import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_fetching_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_query_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/school_inbox_tab_bar_controller.dart';

class SchoolInboxPrimaryController extends GetxController {
  late SchoolInboxTabBarController schoolInboxTabBarController;
  late ConversationQueryController queryController;
  late ConversationFetchingController conversationFetchingController;
  @override
  void onInit() {
    schoolInboxTabBarController = Get.put(SchoolInboxTabBarController());
    queryController = Get.put(ConversationQueryController());
    conversationFetchingController = Get.put(ConversationFetchingController());
    super.onInit();
  }
}

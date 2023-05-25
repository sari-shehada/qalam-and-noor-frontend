import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/pages/school_inbox_page/conversation_body/controllers/selected_conversation_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/conversation_body/views/widgets/chat_bubble.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/ui_tools/text_fields.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../controllers/conversation_body_controller.dart';
import '../../controllers/conversation_communication_controller.dart';

class ConversationListWidget extends StatelessWidget {
  const ConversationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedConversationController selectedConversationController = Get.find();
    ConversationBodyController conversationBodyController = Get.find();
    ConversationCommunicationController conversationCommunicationController =
        Get.find();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Container(
          height: 70.h,
          alignment: Alignment.center,
          child: selectedConversationController
                      .currentConversation.value!.status ==
                  ConversationStatus.closed
              ? const Text(
                  'تم انهاء هذه المحادثة، لا يمكنك الرد',
                )
              : Row(
                  children: [
                    Expanded(
                      child: HintedTextField(
                        hintText: 'نص الرسالة',
                        controller: conversationCommunicationController
                            .messageBodyController,
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    CustomFilledButton(
                      width: 80.w,
                      buttonStatus:
                          conversationCommunicationController.sendButtonStatus,
                      onTap: () => conversationCommunicationController
                          .sendMessageToCurrentConversation(),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90.h),
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primaryContainer,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Builder(builder: (context) {
                return Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedConversationController.currentConversation.value!.studentName} ${selectedConversationController.currentConversation.value!.fatherName} ${selectedConversationController.currentConversation.value!.lastName}',
                            style: ProjectFonts.titleLarge().copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          selectedConversationController
                              .currentConversation.value!.title,
                          style: ProjectFonts.titleLarge(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Obx(
          () {
            switch (
                conversationBodyController.conversationMessagesStatus.value) {
              case ConversationMessagesStatus.isLoading:
                {
                  return const Center(
                    child: LoaderWidget(),
                  );
                }
              case ConversationMessagesStatus.hasMessages:
                {
                  return Obx(
                    () =>
                        conversationBodyController.conversationMessages.isEmpty
                            ? const EmptyItemWidget(
                                itemName: 'رسائل',
                                iconData: FontAwesomeIcons.message,
                              )
                            : ListView.builder(
                                controller: conversationCommunicationController
                                    .scrollController,
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 20.w,
                                ),
                                itemCount: conversationBodyController
                                    .conversationMessages.length,
                                itemBuilder: (context, index) {
                                  return ChatBubble(
                                    message: conversationBodyController
                                        .conversationMessages[index],
                                  );
                                },
                              ),
                  );
                }
              case ConversationMessagesStatus.hasError:
                {
                  return const ErrorLoadingSomethingWidget(
                    somethingName: 'الرسائل',
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/models/conversations/web_conversation.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/conversations_menu/views/widgets/conversation_card.dart';
import 'package:kalam_noor/pages/secretary/school_inbox_page/main_page/controllers/conversation_fetching_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class ConversationsList extends StatelessWidget {
  const ConversationsList({super.key});

  @override
  Widget build(BuildContext context) {
    ConversationFetchingController fetchingController =
        Get.find<ConversationFetchingController>();
    return Column(
      children: [
        Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5.h),
                color: Get.theme.colorScheme.shadow.withOpacity(.06),
                blurRadius: 20,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddHorizontalSpacing(value: 40.w),
              Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.theme.colorScheme.primary.withOpacity(.9),
                ),
              ),
              AddHorizontalSpacing(value: 30.w),
              Text(
                '(محادثات لم يتم الرد عليها)',
                style: ProjectFonts.titleMedium(),
              ),
              const Spacer(),
              Obx(() {
                if (fetchingController.conversationListStatus.value ==
                    ConversationListStatus.hasConversations) {
                  final int unReadConvosCount = fetchingController
                      .conversationsToDisplay
                      .where((p0) => p0.isReadOther == false)
                      .toList()
                      .length;
                  return Text(
                    '$unReadConvosCount محادثة',
                    style: ProjectFonts.titleMedium(),
                  );
                }
                return const SizedBox.shrink();
              }),
              AddHorizontalSpacing(value: 30.w)
            ],
          ),
        ),
        Obx(
          () {
            List<WebConversation> conversationsList =
                fetchingController.conversationsToDisplay;
            return Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                itemCount: conversationsList.length,
                itemBuilder: (context, index) {
                  return ConversationCard(
                    conversation: conversationsList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const Divider(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

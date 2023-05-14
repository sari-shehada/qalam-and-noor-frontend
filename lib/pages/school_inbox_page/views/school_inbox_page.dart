import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/conversations/conversation.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/pages/school_inbox_page/controllers/school_inbox_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/views/widgets/conversations_menu.dart';
import 'package:kalam_noor/pages/school_inbox_page/views/widgets/school_inbox_tabbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../models/conversations/message.dart';

class SchoolInboxPage extends StatelessWidget {
  const SchoolInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SchoolInboxController());
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'بريد المدرسة',
        iconData: FontAwesomeIcons.inbox,
        appBarBoxDecoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Get.theme.colorScheme.shadow.withOpacity(.09),
              blurRadius: 30,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Get.theme.colorScheme.shadow.withOpacity(.09),
                    blurRadius: 40,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: SchoolInboxTabBar(),
                  ),
                  AddHorizontalSpacing(value: 50.w),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchBar(
                            backgroundColor: MaterialStateProperty.all(
                              Get.theme.scaffoldBackgroundColor,
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            hintText: 'البحث حسب اسم او رقم السجل العام للطالب',
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 30.w),
                            ),
                          ),
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                          tooltip: 'إجراء البحث',
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {},
                          tooltip: 'اعادة تعيين النتائج',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: const ConversationMenu(),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Conversation>> getCurrentConversations() async {
  return dummyConvos;
}

List<Conversation> dummyConvos = [
  Conversation(
      id: 1,
      studentId: 1,
      title: 'انذار',
      status: ConversationStatus.open,
      originalIssuer: ConversationParty.secretKeeper),
  Conversation(
      id: 2,
      studentId: 3,
      title: 'تنبيه',
      status: ConversationStatus.open,
      originalIssuer: ConversationParty.secretKeeper),
  Conversation(
      id: 3,
      studentId: 6,
      title: 'تزكية',
      status: ConversationStatus.open,
      originalIssuer: ConversationParty.secretKeeper),
  Conversation(
      id: 4,
      studentId: 2,
      title: 'انذار',
      status: ConversationStatus.open,
      originalIssuer: ConversationParty.secretKeeper),
];

List<Message> messages = [
  Message(
      id: 1,
      title: '',
      body: 'يرجى ... ',
      sender: ConversationParty.secretKeeper,
      sequence: 1,
      date: DateTime.now().subtract(2.days),
      conversationId: 1),
  Message(
      id: 2,
      title: '',
      body: 'علم',
      sender: ConversationParty.parents,
      sequence: 2,
      date: DateTime.now().subtract(1.days),
      conversationId: 1),
  Message(
      id: 3,
      title: '',
      body: 'يرجى ... ',
      sender: ConversationParty.secretKeeper,
      sequence: 1,
      date: DateTime.now().subtract(2.days),
      conversationId: 2),
  Message(
      id: 4,
      title: '',
      body: 'علم',
      sender: ConversationParty.parents,
      sequence: 2,
      date: DateTime.now().subtract(1.days),
      conversationId: 2),
  Message(
      id: 5,
      title: '',
      body: 'يرجى ... ',
      sender: ConversationParty.secretKeeper,
      sequence: 1,
      date: DateTime.now().subtract(2.days),
      conversationId: 3),
  Message(
      id: 6,
      title: '',
      body: 'علم',
      sender: ConversationParty.parents,
      sequence: 2,
      date: DateTime.now().subtract(1.days),
      conversationId: 3),
  Message(
      id: 7,
      title: '',
      body: 'يرجى ... ',
      sender: ConversationParty.secretKeeper,
      sequence: 1,
      date: DateTime.now().subtract(2.days),
      conversationId: 4),
  Message(
      id: 8,
      title: '',
      body: 'علم',
      sender: ConversationParty.parents,
      sequence: 2,
      date: DateTime.now().subtract(1.days),
      conversationId: 4),
  Message(
      id: 9,
      title: '',
      body: 'شكراً',
      sender: ConversationParty.parents,
      sequence: 2,
      date: DateTime.now().subtract(1.days),
      conversationId: 1),
];

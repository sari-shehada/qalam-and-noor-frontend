import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/conversation_body/views/conversation_body.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/conversation_query_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/controllers/school_inbox_primary_controller.dart';
import 'package:kalam_noor/pages/school_inbox_page/conversations_menu/views/conversations_menu.dart';
import 'package:kalam_noor/pages/school_inbox_page/main_page/views/widgets/school_inbox_tabbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class SchoolInboxPage extends StatelessWidget {
  const SchoolInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SchoolInboxPrimaryController());
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
                            controller: Get.find<ConversationQueryController>()
                                .searchFieldController,
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
                          onPressed: () =>
                              Get.find<ConversationQueryController>()
                                  .updateQuery(),
                          tooltip: 'إجراء البحث',
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () =>
                              Get.find<ConversationQueryController>()
                                  .resetSearchField(),
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
                  const Expanded(
                    flex: 7,
                    child: ConversationBodyWidget(),
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/controllers/school_inbox_controller.dart';
import 'package:kalam_noor/tools/ui_tools/loader_widget.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import 'package:kalam_noor/tools/widgets/error_loading_something_widget.dart';

import '../../../../models/conversations/conversation.dart';

class ConversationMenu extends StatelessWidget {
  const ConversationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final SchoolInboxController controller = Get.find();
    return Obx(
      () => FutureBuilder<List<Conversation>>(
        future: controller.conversations.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoaderWidget(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const EmptyItemWidget(
                    itemName: 'محادثات', iconData: FontAwesomeIcons.message);
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            }
            if (!snapshot.hasData) {
              return const EmptyItemWidget(
                  itemName: 'محادثات', iconData: FontAwesomeIcons.message);
            }
            if (snapshot.hasError) {
              return ErrorLoadingSomethingWidget(
                somethingName: 'محادثات',
                retryCallback: () {},
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

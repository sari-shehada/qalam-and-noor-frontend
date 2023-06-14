import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/conversations_list.dart';
import '../../main_page/controllers/conversation_fetching_controller.dart';
import '../../../../../tools/ui_tools/loader_widget.dart';

class ConversationMenu extends StatelessWidget {
  const ConversationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ConversationFetchingController fetchingController = Get.find();
    // return StreamBuilder(
    //   stream: fetchingController.conversationListStatus.stream,
    //   builder: (context, snapshot) {
    //     if (snapshot.data == null) {
    //       return const Center(
    //         child: LoaderWidget(),
    //       );
    //     }
    //     switch (snapshot.data!) {
    //       case ConversationListStatus.isLoading:
    //         {
    //           return const Center(
    //             child: LoaderWidget(),
    //           );
    //         }
    //       case ConversationListStatus.hasConversations:
    //         {
    //           return const ConversationsList();
    //         }
    //       case ConversationListStatus.hasError:
    //         {
    //           return const ErrorLoadingSomethingWidget(
    //             somethingName: 'محادثات',
    //           );
    //         }
    //     }
    //   },
    // );
    return Obx(() {
      if (fetchingController.conversationListStatus.value ==
          ConversationListStatus.isLoading) {
        return const Center(
          child: LoaderWidget(),
        );
      }
      return const ConversationsList();
    });
  }
}


// Obx(
//       () => FutureBuilder<List<Conversation>>(
//         future: controller.conversations.value,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
            
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               if (snapshot.data!.isEmpty) {
//                 return const EmptyItemWidget(
//                     itemName: 'محادثات', iconData: FontAwesomeIcons.message);
//               }
//               return ListView.separated(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(snapshot.data![index].title),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return const Divider();
//                 },
//               );
//             }
//             if (!snapshot.hasData) {
//               return const EmptyItemWidget(
//                   itemName: 'محادثات', iconData: FontAwesomeIcons.message);
//             }
//             if (snapshot.hasError) {
//               return ErrorLoadingSomethingWidget(
//                 somethingName: 'محادثات',
//                 retryCallback: () {},
//               );
//             }
//           }
//           return const SizedBox.shrink();
//         },
//       ),
//     );
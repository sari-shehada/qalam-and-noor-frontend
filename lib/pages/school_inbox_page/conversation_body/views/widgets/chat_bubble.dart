import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/conversations/message.dart';
import '../../../../../models/enums.dart';
import 'package:intl/intl.dart' as intl;

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, Key? key}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    final bool isSenderNotParent = message.sender == ConversationParty.parents;
    final String sentTimeInString =
        intl.DateFormat('dd/MM/yyyy \'الساعة\' HH:mm').format(message.date);

    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
        right: isSenderNotParent ? 40.w : 0,
        left: isSenderNotParent ? 0 : 40.w,
      ),
      child: Align(
        alignment:
            isSenderNotParent ? Alignment.centerLeft : Alignment.centerRight,
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 170.w),
              child: Container(
                padding: EdgeInsets.only(
                    top: 11.h, right: 11.h, left: 11.h, bottom: 40.h),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      spreadRadius: 1,
                      offset: const Offset(-1, 2),
                      blurRadius: 2,
                    ),
                  ],
                  color: isSenderNotParent
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                    bottomLeft:
                        isSenderNotParent ? Radius.zero : Radius.circular(12.r),
                    bottomRight:
                        isSenderNotParent ? Radius.circular(12.r) : Radius.zero,
                  ),
                ),
                child: Text(
                  message.body,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isSenderNotParent
                          ? Theme.of(context).colorScheme.onSurface
                          : Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Positioned(
              bottom: 11.h,
              right: isSenderNotParent ? null : 11.h,
              left: isSenderNotParent ? 11.h : null,
              child: Text(
                sentTimeInString,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: isSenderNotParent
                      ? Colors.grey[500]
                      : Colors.white.withOpacity(.7),
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';
import 'package:kalam_noor/models/conversations/web_conversation.dart';
import 'package:kalam_noor/models/enums.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    super.key,
    required this.conversation,
  });

  final WebConversation conversation;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Get.theme.colorScheme;
    final RxBool isSelected = false.obs;
    final isParents = conversation.orginalIssuer == ConversationParty.parents;
    final RxBool isHovered = false.obs;
    return Obx(
      () {
        isSelected;
        return AnimatedContainer(
          duration: 150.milliseconds,
          height: 76.h,
          margin: isSelected.value
              ? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: isSelected.value
                ? colorScheme.primaryContainer
                : colorScheme.primaryContainer.withOpacity(0),
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.circular(GlobalStyles.globalBorderRadius),
            child: InkWell(
              onHover: (value) {
                isHovered.value = value;
              },
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              onTap: () => isSelected.value = !isSelected.value,
              child: AnimatedPadding(
                padding: isSelected.value
                    ? EdgeInsetsDirectional.only(start: 30.w, end: 55.w)
                    : isHovered.value
                        ? EdgeInsetsDirectional.only(start: 25.w, end: 50.w)
                        : EdgeInsetsDirectional.only(start: 20.w, end: 45.w),
                duration: 150.milliseconds,
                child: Row(
                  children: [
                    Container(
                      width: 50.sp,
                      height: 50.sp,
                      alignment: Alignment.center,
                      child: FaIcon(
                        isParents
                            ? FontAwesomeIcons.userGroup
                            : FontAwesomeIcons.userTie,
                        size: 30.sp,
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          conversation.title,
                          style: ProjectFonts.titleMedium(),
                        ),
                        AddVerticalSpacing(value: 6.h),
                        Text(
                          '${conversation.studentName} ${conversation.lastName}',
                          style: ProjectFonts.titleSmall(),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: conversation.isReadOther
                            ? colorScheme.primary.withOpacity(0)
                            : colorScheme.primary.withOpacity(.9),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

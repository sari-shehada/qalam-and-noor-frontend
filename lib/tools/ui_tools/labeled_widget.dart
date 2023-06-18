import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui_tools.dart';

class LabeledWidget extends StatelessWidget {
  const LabeledWidget({
    super.key,
    required this.label,
    this.spacing = 20,
    required this.child,
    this.labelTextStyle,
    this.mainAxisSize = MainAxisSize.max,
    this.textAlignment,
  });

  final String label;
  final double spacing;
  final Widget child;
  final TextStyle? labelTextStyle;
  final MainAxisSize mainAxisSize;
  final Alignment? textAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      children: [
        Align(
          alignment: textAlignment ?? Alignment.centerRight,
          child: Text(
            label,
            style: labelTextStyle ??
                TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
          ),
        ),
        AddVerticalSpacing(value: spacing.h),
        child
      ],
    );
  }
}

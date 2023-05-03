import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.backgroundColor,
    required this.value,
    this.dropdownColor,
    this.textStyle,
    required this.items,
    this.onChanged,
    this.isExpanded = false,
    this.isDense = true,
    this.hint,
  });

  final Color? backgroundColor;
  final Rx<T?> value;
  final Color? dropdownColor;
  final TextStyle? textStyle;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final bool isExpanded;
  final bool isDense;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: backgroundColor,
      ),
      child: Obx(
        () {
          return DropdownButton<T>(
            // icon: SizedBox.shrink(),
            underline: const SizedBox.shrink(),
            isDense: isDense,
            isExpanded: isExpanded,

            style: textStyle ?? Get.textTheme.titleMedium,
            borderRadius: BorderRadius.circular(14.r),
            dropdownColor: dropdownColor,
            value: value.value,
            items: items,
            onChanged: onChanged,
            hint: hint == null ? null : Text(hint!),
          );
        },
      ),
    );
  }
}

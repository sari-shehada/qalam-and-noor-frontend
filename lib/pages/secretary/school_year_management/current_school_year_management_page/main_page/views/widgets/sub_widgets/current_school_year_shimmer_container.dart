import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CurrentSchoolYearShimmerContainer extends StatelessWidget {
  ///Nullable as to be a placeholder
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final bool buildChildWithContainer;
  const CurrentSchoolYearShimmerContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.boxShadow,
    this.buildChildWithContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(20.r),
          ),
      child: child == null
          ? Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(1),
              highlightColor: Get.theme.scaffoldBackgroundColor,
              direction: ShimmerDirection.rtl,
              child: _buildChild(),
            )
          : buildChildWithContainer == false
              ? child
              : _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: const Color(0xFF393939).withOpacity(.06),
                blurRadius: 60,
                offset: const Offset(0, 30),
              ),
            ],
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(20.r),
            ),
      ),
      child: child,
    );
  }
}

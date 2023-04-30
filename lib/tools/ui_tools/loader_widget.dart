import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeRotatingDots(
      color: color ?? Color(0xFF265CB1),
      size: size ?? 80.h,
    );
  }
}

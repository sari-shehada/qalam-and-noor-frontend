import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PsychologicalStatusIndicator extends StatelessWidget {
  const PsychologicalStatusIndicator({
    super.key,
    required this.value,
    required this.valueColor,
  });
  final double value;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 12.h,
      width: 220.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: LinearProgressIndicator(
              color: valueColor,
              backgroundColor: Colors.black.withOpacity(.4),
              value: value,
            ),
          ),
          Text(
            "${value * 100}%",
            style: TextStyle(fontSize: 10.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

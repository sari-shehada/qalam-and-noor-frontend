import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalam_noor/configs/assets.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/configs/styles.dart';

class TeachersCountWidget extends StatelessWidget {
  const TeachersCountWidget({super.key, required this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -125.w,
            width: 660.w,
            height: 402.h,
            child: SvgPicture.asset(
              GlobalAssets.teachersIllustration,
              fit: BoxFit.fitWidth,
              colorBlendMode: BlendMode.multiply,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 660.w,
              height: 402.h,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(GlobalStyles.globalBorderRadius),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(.8),
                    Colors.white.withOpacity(.5),
                    Colors.white.withOpacity(0),
                  ],
                  stops: const [
                    0,
                    .24,
                    .45,
                    1,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(right: 25.w, top: 20.h, bottom: 20.h),
              decoration: const BoxDecoration(),
              width: 170.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    count.toString(),
                    style: ProjectFonts.displayMedium(),
                  ),
                  Text(
                    'عدد المدرسين الكلي',
                    textAlign: TextAlign.start,
                    style: ProjectFonts.displaySmall(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

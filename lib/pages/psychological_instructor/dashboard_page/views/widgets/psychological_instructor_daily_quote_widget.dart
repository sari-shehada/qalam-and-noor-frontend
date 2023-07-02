import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../configs/assets.dart';
import '../../../../../configs/fonts.dart';
import '../../../../secretary/dashboard_page/views/widgets/daily_quote_widget.dart';
import '../../controller/psychological_instructor_dashboard_controller.dart';

class PsychologicalInstructorDailyQuoteWidget
    extends GetView<PsychologicalInstructorDashboardController> {
  const PsychologicalInstructorDailyQuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DailyQuote quote = controller.dailyQuote.value!;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -40.h,
          right: -30.w,
          height: 200.sp,
          width: 200.sp,
          child: Image.asset(
            GlobalAssets.quotesIcon,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Get.theme.colorScheme.primaryContainer.withOpacity(.5),
                // Colors.white,
                Colors.white,
                Colors.white.withOpacity(0),
              ],
              stops: const [
                0,
                .85,
                1,
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 100.w,
          child: Text(
            '''"${quote.quote}"''',
            style: ProjectFonts.headlineMedium().copyWith(
              color: Get.theme.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 50.w,
          child: Text(
            quote.credit,
            style: ProjectFonts.headlineMedium().copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

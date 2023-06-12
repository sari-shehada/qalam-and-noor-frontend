import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/pages/dashboard/controllers/dashboard_controller.dart';

class DailyQuoteWidget extends GetView<DashboardController> {
  const DailyQuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DailyQuote quote = controller.dailyQuote.value!;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 25.h,
          right: 40.w,
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
          left: 0,
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

class DailyQuote {
  String quote;
  String credit;
  DailyQuote({
    required this.quote,
    required this.credit,
  });
}

List<DailyQuote> dailyQuotes = [
  DailyQuote(
    quote: 'اذا علمت ولداً فقد علمت فرداً .. و اذا علمت بنتاً فقد علمت أمة .',
    credit: 'ابن باديس',
  ),
];

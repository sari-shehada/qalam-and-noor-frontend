import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // DashboardController dashboardController = Get.find();
    // AccountController accountController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1100.w,
              child: TextField(
                style: TextStyle(
                  fontSize: 26.sp,
                  color: const Color(0xFF000000),
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFE1E5EA),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 80.w,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  hintText: 'البحث',
                  hintStyle: TextStyle(
                    fontSize: 26.sp,
                    color: const Color(0xFF616265),
                  ),
                  // suffixIconConstraints: BoxConstraints(),
                  suffix: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                      size: 25.sp,
                    ),
                    //TODO:
                    onPressed: () {},
                  ),
                ),
                // textInputAction: TextInputAction.search,
              ),
            ),
            Row(
              children: const [],
            )
          ],
        ),
      ),
    );
  }
}

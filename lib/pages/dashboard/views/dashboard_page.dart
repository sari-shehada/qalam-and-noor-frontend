import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

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
            Row(
              children: [
                AddHorizontalSpacing(value: 50.w),
                Container(
                  width: 520.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFE4E4E4),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// SizedBox(
//                   width: 1120.w,
//                   child: TextField(
//                     style: TextStyle(
//                       fontSize: 26.sp,
//                       color: const Color(0xFF000000),
//                     ),
//                     decoration: InputDecoration(
//                       fillColor: const Color(0xFFE1E5EA),
//                       filled: true,
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: 20.h,
//                         horizontal: 80.w,
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                       hintText: 'البحث',
//                       hintStyle: TextStyle(
//                         fontSize: 26.sp,
//                         color: const Color(0xFF616265),
//                       ),
//                       // suffixIconConstraints: BoxConstraints(),
//                       suffix: IconButton(
//                         icon: FaIcon(
//                           FontAwesomeIcons.magnifyingGlass,
//                           color: Colors.black,
//                           size: 25.sp,
//                         ),
//                         //TODO:
//                         onPressed: () {},
//                       ),
//                     ),
//                     // textInputAction: TextInputAction.search,
//                   ),
//                 ),
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/dashboard/views/widgets/student_count_widget.dart';
import 'package:kalam_noor/pages/settings/views/settings_page.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/account_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    AccountController accountController = Get.find();
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //KEY: Top Search Fields
              Row(
                children: [
                  Container(
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: const Color(0xFFE1E5EA),
                    ),
                    width: 1120.w,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 26.sp,
                        color: const Color(0xFF000000),
                      ),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFE1E5EA),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 30.h,
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
                  AddHorizontalSpacing(value: 50.w),
                  Container(
                    width: 520.w,
                    height: 90.h,
                    padding: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1E5EA),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 68.w,
                          width: 68.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            accountController.employee.getAvatarImage(),
                            height: 55.w,
                            width: 55.w,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        AddHorizontalSpacing(value: 30.w),
                        Text(
                          '${accountController.employee.firstName} ${accountController.employee.lastName}',
                          style: TextStyle(
                            fontSize: 27.sp,
                            color: const Color(0xFF5D636D),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          //TODO:
                          onTap: () => Get.to(
                            () => const SettingsPage(),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.gear,
                            size: 30.sp,
                            color: const Color(0xFF5D636D),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              AddVerticalSpacing(value: 50.h),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const _DashboardContainer(
                            width: 670,
                            height: 402,
                          ),
                          AddHorizontalSpacing(value: 30.w),
                          FutureBuilder<int>(
                            future: controller.studentCount.value,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.r),
                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: Get.theme.colorScheme.primary
                                        .withOpacity(.03),
                                    highlightColor: Get
                                        .theme.colorScheme.primary
                                        .withOpacity(.2),
                                    direction: ShimmerDirection.rtl,
                                    child: const _DashboardContainer(
                                      width: 588,
                                      height: 402,
                                    ),
                                  ),
                                );
                              }
                              return _DashboardContainer(
                                width: 588,
                                height: 402,
                                child: StudentCountWidget(
                                    count: snapshot.data ?? 0),
                              );
                            },
                          ),
                        ],
                      ),
                      AddVerticalSpacing(value: 40.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const _DashboardContainer(
                                    width: 373,
                                    height: 398,
                                  ),
                                  AddHorizontalSpacing(value: 35.w),
                                  Column(
                                    children: [
                                      _DashboardContainer(
                                        width: 334,
                                        height: 184,
                                        child: Material(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.r),
                                          ),
                                          color: Colors.transparent,
                                          child: InkWell(
                                            hoverColor: Get.theme.colorScheme
                                                .primaryContainer,
                                            onTap: () =>
                                                controller.registerNewStudent(),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30.h, bottom: 30.h),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.userPlus,
                                                    size: 50.h,
                                                    color: Get.theme.colorScheme
                                                        .primary,
                                                  ),
                                                  Text(
                                                    'تسجيل طالب جديد',
                                                    style: TextStyle(
                                                      fontSize: 29.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Get.theme
                                                          .colorScheme.primary,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AddVerticalSpacing(value: 30.h),
                                      const _DashboardContainer(
                                        width: 334,
                                        height: 184,
                                      ),
                                    ],
                                  ),
                                  AddHorizontalSpacing(value: 35.w),
                                  const _DashboardContainer(
                                    width: 511,
                                    height: 398,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  AddHorizontalSpacing(value: 30.w),
                  //List View Goes Here
                  SizedBox(
                    height: 840.h,
                    width: 372.w,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return _DashboardContainer(
                            width: 372,
                            height: 241,
                            margin: EdgeInsets.only(bottom: 30.h),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardContainer extends StatelessWidget {
  ///Responsive
  final double height;

  ///Responsive
  final double width;

  ///Nullable as to be a placeholder
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const _DashboardContainer({
    required this.height,
    required this.width,
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF393939).withOpacity(.06),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: child,
    );
  }
}

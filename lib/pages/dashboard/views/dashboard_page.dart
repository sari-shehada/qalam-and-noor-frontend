import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // DashboardController dashboardController = Get.find();
    // AccountController accountController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //KEY: Top Search Fields

              Row(
                children: [
                  SizedBox(
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
                  Container(
                    width: 520.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFE4E4E4),
                      borderRadius: BorderRadius.circular(100.r),
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
                          const _DashboardContainer(
                            width: 588,
                            height: 402,
                          ),
                        ],
                      ),
                      AddVerticalSpacing(value: 40.h),
                      Row(
                        children: [
                          SizedBox(
                            child: Column(
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
                                        const _DashboardContainer(
                                          width: 334,
                                          height: 184,
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
  const _DashboardContainer(
      {required this.height,
      required this.width,
      this.child,
      this.margin,
      this.padding});

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

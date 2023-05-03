import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchFieldMedium extends StatelessWidget {
  const CustomSearchFieldMedium({
    super.key,
    required this.hintText,
    required this.callback,
  });

  final String hintText;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650.w,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 22.sp,
          color: const Color(0xFF000000),
        ),
        decoration: InputDecoration(
          fillColor: const Color(0xFFE1E5EA),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 50.w,
          ),
          // isCollapsed: true,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100.r),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 22.sp,
            color: const Color(0xFF616265),
          ),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
                size: 25.sp,
              ),
              onPressed: callback,
            ),
          ),
        ),
        // textInputAction: TextInputAction.search,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressesCountSubCard extends StatelessWidget {
  const AddressesCountSubCard({
    super.key,
    required this.count,
  });

  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          const Text(
            'عدد العناوين',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFA9746),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AreasCountSubCard extends StatelessWidget {
  const AreasCountSubCard({
    super.key,
    required this.count,
  });

  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          const Text(
            'عدد المناطق',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE03168),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

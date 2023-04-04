import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityStatsCard extends StatelessWidget {
  const CityStatsCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  final String title;
  final Future<int> count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.blueGrey,
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 25.w,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: FutureBuilder(
              future: count,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

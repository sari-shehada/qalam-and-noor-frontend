import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../models/address/area.dart';
import '../../../area_details_page/controllers/area_details_controller.dart';
import '../../../area_details_page/views/area_details_page.dart';

import '../../../city_details_page/controllers/city_details_controller.dart';

import '../../../../../../tools/ui_tools/ui_tools.dart';

class AreaCard extends StatelessWidget {
  const AreaCard({
    super.key,
    required this.area,
  });

  final Area area;
  @override
  Widget build(BuildContext context) {
    CityDetailsController controller = Get.find();
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      builder: (context, opacity, _) {
        return InkWell(
          onTap: () => Get.to(
            const AreaDetailsPage(),
            binding: BindingsBuilder(
              () {
                Get.put(AreaDetailsController(area: area));
              },
            ),
          ),
          child: Opacity(
            opacity: opacity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 0.h,
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 2.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blueGrey.withOpacity(.7),
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: Row(children: [
                  AddHorizontalSpacing(value: 15.w),
                  Text(
                    area.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.to(
                      const AreaDetailsPage(),
                      binding: BindingsBuilder(
                        () {
                          Get.put(AreaDetailsController(area: area));
                        },
                      ),
                    ),
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                  AddHorizontalSpacing(value: 10.w),
                  IconButton(
                    onPressed: () => controller.updateAreaInfo(area),
                    icon: Icon(
                      Icons.edit,
                      color: Get.theme.colorScheme.primary.withOpacity(.7),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}


// class AreaCard extends StatelessWidget {
//   const AreaCard({
//     super.key,
//     required this.area,
//   });

//   final Area area;
//   @override
//   Widget build(BuildContext context) {
//     // AddressManagementController addressManagementController = Get.find();

//     return Container(
//       width: 815.w,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(
//           14.r,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF393939).withOpacity(.06),
//             blurRadius: 60,
//             offset: Offset(0.w, 30.h),
//           ),
//         ],
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(14.r),
//         child: InkWell(
//           onTap: () =>
//               Get.to(const AreaDetailsPage(), binding: BindingsBuilder(() {
//             Get.put(
//               AreaDetailsController(area: area),
//             );
//           })),
//           borderRadius: BorderRadius.circular(14.r),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 25.h,
//               horizontal: 30.w,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   area.name,
//                   style: TextStyle(
//                     fontSize: 40.sp,
//                     color: Get.theme.colorScheme.primary,
//                   ),
//                 ),
//                 const Spacer(),
//                 CityStatsCard(
//                   title: 'عدد العناوين',
//                   count: DatabaseHelper.getAreaAddressesCount(area.id),
//                   color: const Color(0xFFFA9746),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

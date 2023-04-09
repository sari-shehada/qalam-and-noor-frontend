import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../models/address/address.dart';
import '../controllers/area_details_controller.dart';

import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';

class AreaDetailsPage extends StatelessWidget {
  const AreaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AreaDetailsController controller = Get.find();
    return Scaffold(
      floatingActionButton: CallToActionButton(
        onTap: () => controller.addNewAddress(),
        height: 74.h,
        width: 300.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة عنوان جديد',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 28.sp,
                )
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: controller.area.name,
        iconData: FontAwesomeIcons.locationDot,
        backButtonEnabled: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20.h,
          start: 60.w,
          end: 60.w,
        ),
        child: Obx(
          () => FutureBuilder(
            future: controller.addresses.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  //TODO: Change later
                  child: Text('Error Loading Addresses'),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  //TODO:
                  return const Center(
                    //TODO: Change later
                    child: Text('no addresses yet'),
                  );
                } else {
                  List<Address> areas = snapshot.data as List<Address>;
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: areas.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 3.h,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 10.h,
                      mainAxisExtent: 140.h,
                    ),
                    itemBuilder: (context, index) {
                      Address address = areas[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              address.name,
                              style: TextStyle(
                                fontSize: 30.sp,
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                            subtitle: address.details != null
                                ? Padding(
                                    padding: EdgeInsets.only(top: 7.h),
                                    child: Text(
                                      address.details!,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  )
                                : null,
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  );
                }
              } else {
                return const Center(
                  //TODO:
                  child: Text('no addresses yet'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

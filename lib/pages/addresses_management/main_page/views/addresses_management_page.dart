import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../models/address/city.dart';
import '../controllers/address_management_controller.dart';

import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import 'widgets/city_card.dart';

class AddressesManagementPage extends StatelessWidget {
  const AddressesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressManagementController addressManagementController = Get.put(
      AddressManagementController(),
    );
    return Scaffold(
      floatingActionButton: CallToActionButton(
        onTap: () => addressManagementController.addNewCity(),
        height: 74.h,
        width: 300.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              children: [
                Text(
                  'إضافة مدينة جديدة',
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
      appBar: const CustomAppBar(
        title: 'إدارة العناوين',
        iconData: FontAwesomeIcons.locationDot,
        // actionButton: CustomAppBarActionButton(
        //   label: 'إضافة عنوان جديد',
        //   onTap: () => addressManagementController.addAddress(),
        // ),
      ),
      body: SizedBox.expand(
        child: Obx(() {
          return FutureBuilder<RxList<City>>(
            future: addressManagementController.cities.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                //TODO: Change later
                return const Center(
                  child: Text('error loading addresses'),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  //TODO: Change later
                  return const Center(
                    child: Text('no addresses yet'),
                  );
                } else {
                  RxList<City> cities = snapshot.data as RxList<City>;
                  return GridView.builder(
                    padding: EdgeInsetsDirectional.only(
                      top: 20.h,
                      start: 60.w,
                      end: 60.w,
                      bottom: 120.h,
                    ),
                    itemCount: cities.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 250.h,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h,
                    ),
                    itemBuilder: (context, index) => CityCard(
                      city: cities[index],
                    ),
                  );
                }
              } else {
                return const Center(
                  child: Text('no addresses yet'),
                );
              }
            },
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/new_student_registration/student_information/views/new_student_registration_page.dart';
import 'package:kalam_noor/tools/ui_tools/custom_scaffold.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';
import '../../../../models/address/city.dart';
import '../../city_details_page/controllers/city_details_controller.dart';
import '../../city_details_page/views/city_details_page.dart';
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
    return CustomScaffold(
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
        appBarBoxDecoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
      body: LabeledWidget(
        label: 'المدن الحالية',
        labelTextStyle: TextStyle(
          fontSize: 25.sp,
        ),
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
                  return const EmptyItemWidget(
                    itemName: 'مدن',
                    iconData: FontAwesomeIcons.locationArrow,
                  );
                } else {
                  RxList<City> cities = snapshot.data as RxList<City>;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 90.h,
                        crossAxisSpacing: 10.w,
                      ),
                      padding: EdgeInsetsDirectional.only(top: 20.h),
                      itemCount: cities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CityCard(city: cities[index]);
                      },
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/city.dart';
import 'package:kalam_noor/pages/addresses_management/controllers/address_management_controller.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import 'widgets/address_card.dart';

class AddressesManagementPage extends StatelessWidget {
  const AddressesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressManagementController addressManagementController = Get.put(
      AddressManagementController(),
    );
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 50.h,
            start: 60.w,
            end: 60.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.locationDot,
                    size: 64.sp,
                    color: Colors.black,
                  ),
                  AddHorizontalSpacing(value: 35.w),
                  Text(
                    'إدارة العناوين',
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  CallToActionButton(
                    onTap: () => addressManagementController.addAddress(),
                    height: 74.h,
                    width: 403.w,
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
                  )
                ],
              ),
              AddVerticalSpacing(value: 60.h),
              Expanded(
                  child: FutureBuilder<RxList<City>>(
                future: addressManagementController.cities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('error loading addreses'),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('no addresses yet'),
                      );
                    } else {
                      RxList<City> cities = snapshot.data as RxList<City>;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cities.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2.4.h,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 20.h,
                        ),
                        itemBuilder: (context, index) => AddressCard(
                          city: cities[index],
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text('no addresses yet'),
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/address/area.dart';
import 'package:kalam_noor/pages/addresses_management/city_details_page/controllers/city_details_controller.dart';
import 'package:kalam_noor/pages/addresses_management/city_details_page/views/widgets/area_card.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';

class CityDetailsPage extends StatelessWidget {
  const CityDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CityDetailsController cityDetailsController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: cityDetailsController.city.name,
        iconData: FontAwesomeIcons.locationDot,
        backButtonEnabled: true,
        // actionButton: CustomAppBarActionButton(
        //   label: 'إضافة عنوان جديد',
        //   onTap: () => addressManagementController.addAddress(),
        // ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20.h,
          start: 60.w,
          end: 60.w,
        ),
        child: FutureBuilder(
          future: cityDetailsController.areas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                //TODO:
                child: Text('Error Loading Cities'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                //TODO:
                return const Center(
                  child: Text('no addresses yet'),
                );
              } else {
                List<Area> areas = snapshot.data as List<Area>;
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: areas.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // childAspectRatio: 3.h,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                    mainAxisExtent: 200.h,
                  ),
                  itemBuilder: (context, index) => AreaCard(
                    area: areas[index],
                  ),
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
    );
  }
}

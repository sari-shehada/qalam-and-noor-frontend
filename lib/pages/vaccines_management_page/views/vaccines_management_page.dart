import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/medical/vaccine.dart';
import 'package:kalam_noor/tools/ui_tools/custom_appbar.dart';
import 'package:kalam_noor/tools/widgets/empty_item_widget.dart';

import '../controllers/vaccines_management_controller.dart';

class VaccinesManagementPage extends StatelessWidget {
  const VaccinesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    VaccinesManagementController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'اللقاحات',
        iconData: FontAwesomeIcons.syringe,
        backButtonEnabled: true,
      ),
      body: SizedBox.expand(
        child: FutureBuilder(
          future: controller.vaccines,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const EmptyItemWidget(
                        itemName: 'لقاحات',
                        iconData: FontAwesomeIcons.syringe,
                      );
                    }
                    List<Vaccine> vaccines = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      itemCount: vaccines.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.w,
                        mainAxisSpacing: 20.w,
                        // mainAxisExtent: 50.h,
                        childAspectRatio: 7,
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          //TODO:
                          onTap: () {},
                          title: Text(vaccines[index].name),
                          trailing: Icon(
                            Icons.edit,
                          ),
                        );
                      },
                    );
                  }
                  return const EmptyItemWidget(
                    itemName: 'لقاحات',
                    iconData: FontAwesomeIcons.syringe,
                  );
                }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

// class VaccinesManagementPage extends StatelessWidget {
//   const VaccinesManagementPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'اللقاحات',
//         iconData: FontAwesomeIcons.syringe,
//       ),
//       body: SizedBox.expand(
//         child: FutureBuilder(builder:
//         ),
//       ),
//     );
//   }
// }

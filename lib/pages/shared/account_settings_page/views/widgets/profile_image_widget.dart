import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../tools/ui_tools/loader_widget.dart';
import '../../controllers/settings_page_controller.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsPageController controller = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            color: Colors.black.withOpacity(.06),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.0.h),
      child: ClipOval(
        child: FutureBuilder<ImageProvider>(
          future: controller.profileImage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            return Image(
              image: snapshot.data!,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

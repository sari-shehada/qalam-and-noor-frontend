import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';

class SettingsPageController extends GetxController {
  SettingsPageController({
    required this.employee,
    required this.jobTitle,
  });
  final Employee employee;
  final JobTitle jobTitle;
  late Future<ImageProvider> profileImage;
  @override
  onInit() {
    profileImage = getAvatarImage();
    super.onInit();
  }

  Future<ImageProvider> getAvatarImage() async {
    return AssetImage(
      employee.getAvatarImage(),
    );
  }

  String getFullName() {
    return '${employee.firstName} ${employee.lastName}';
  }
}

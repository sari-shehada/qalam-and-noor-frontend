import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../models/agendas/employee.dart';

class LoaderPageAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<Employee?> employee = Rx<Employee?>(null);
  Tween<double> logoPosition = Tween(begin: 250.h, end: -330.h);
  Tween<double> textPosition = Tween(begin: 734.h, end: 908.h);
  Tween<double> userInfoOpacity = Tween(begin: 0.0, end: 1.0);

  late Animation logoAnimation;
  late Animation textAnimation;
  late Animation userInfoAnimation;

  late AnimationController animationController;
  late AnimationController userInfoAnimationController;

  LoaderPageAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: 800.milliseconds,
    );
    logoAnimation = logoPosition.animate(CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut));
    textAnimation = textPosition.animate(CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut));
    userInfoAnimationController =
        AnimationController(vsync: this, duration: 800.milliseconds);
    userInfoAnimation = userInfoOpacity.animate(CurvedAnimation(
        parent: userInfoAnimationController, curve: Curves.linearToEaseOut));
  }

  Future<void> welcomeUser(Employee employee) async {
    this.employee.value = employee;
    await userInfoAnimationController.forward();
    await Future.delayed(250.milliseconds);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/assets.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/loader/controllers/loader_controller.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../configs/fonts.dart';

//TODO: Rethink
class LoaderPage extends StatefulWidget {
  const LoaderPage({super.key});

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoaderController loaderController = Get.find();
      loaderController.loadApplication();
      loaderController.dispose();
    });
    return Scaffold(
      backgroundColor: lightColorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              GlobalAssets.appLogoPath,
              scale: .85,
            ),
            const AddVerticalSpacing(value: 250),
            Text(
              'جار التحميل...',
              style: ProjectFonts.headlineMedium.copyWith(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}

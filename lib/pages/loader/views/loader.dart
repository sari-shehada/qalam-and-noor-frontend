import 'package:flutter/material.dart';
import 'package:kalam_noor/configs/assets.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../configs/fonts.dart';

//TODO: Rethink
class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
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

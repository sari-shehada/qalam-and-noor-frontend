import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/fonts.dart';

import '../../configs/project_themes.dart';
import '../../configs/styles.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    super.key,
    required this.label,
    this.labelColor,
    required this.onTap,
    this.backgroundColor,
  });

  final String label;
  final Color? labelColor;
  final VoidCallback onTap;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 12,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? Get.theme.colorScheme.primary,
        elevation: 0,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              fontFamily: ProjectFonts.fontFamily,
              fontSize: 17,
              color: labelColor ?? lightColorScheme.primaryContainer,
            ),
          )),
        ),
      ),
    );
  }
}

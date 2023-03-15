import 'package:flutter/material.dart';

import '../../../../configs/project_themes.dart';
import '../../../../configs/styles.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
      decoration: BoxDecoration(
        color: lightColorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(-2, -2),
        //     color: Colors.black.withOpacity(.08),
        //     blurRadius: 12,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.home,
                color: lightColorScheme.secondary,
                size: 50,
              ),
              const AddHorizontalSpacing(value: 20),
              Text(
                'ادارة السجل العام',
                style: TextStyle(
                  fontSize: 20,
                  color: lightColorScheme.secondary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

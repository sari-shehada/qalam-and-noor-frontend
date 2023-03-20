import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../configs/fonts.dart';
import '../../models/dashboard_destination_card.dart';

import '../../../../configs/project_themes.dart';
import '../../../../configs/styles.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.dashboardDestinationCard,
    required this.onTap,
  });

  final DashboardDestinationCard dashboardDestinationCard;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(-2, -2),
        //     color: Colors.black.withOpacity(.08),
        //     blurRadius: 12,
        //   ),
        // ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        color: lightColorScheme.secondaryContainer,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    FaIcon(
                      dashboardDestinationCard.iconData,
                      color: lightColorScheme.secondary,
                      size: 27,
                    ),
                    const AddHorizontalSpacing(value: 20),
                    Text(
                      dashboardDestinationCard.title,
                      style: TextStyle(
                        fontFamily: ProjectFonts.fontFamily,
                        fontSize: 16,
                        color: lightColorScheme.secondary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

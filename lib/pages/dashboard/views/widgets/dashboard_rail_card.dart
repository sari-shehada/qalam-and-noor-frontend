import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalam_noor/configs/project_themes.dart';
import 'package:kalam_noor/pages/dashboard/models/dashboard_destination_card.dart';

import '../../../../tools/ui_tools/ui_tools.dart';

class DashboardExpandedRailCard extends StatelessWidget {
  const DashboardExpandedRailCard(
      {super.key,
      required this.dashboardDestinationCard,
      required this.isSelected,
      required this.onTap});

  final DashboardDestinationCard dashboardDestinationCard;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          isSelected ? lightColorScheme.secondaryContainer : Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          child: Row(
            children: [
              Icon(dashboardDestinationCard.iconData),
              const AddHorizontalSpacing(value: 14),
              Text(
                dashboardDestinationCard.title,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCollapsedRailCard extends StatelessWidget {
  const DashboardCollapsedRailCard(
      {super.key,
      required this.dashboardDestinationCard,
      required this.isSelected,
      required this.onTap});

  final DashboardDestinationCard dashboardDestinationCard;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color:
          isSelected ? lightColorScheme.secondaryContainer : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FaIcon(
            dashboardDestinationCard.iconData,
            color: isSelected
                ? lightColorScheme.secondary
                : lightColorScheme.inverseSurface,
            size: 23,
          ),
        ),
      ),
    );
  }
}

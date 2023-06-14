import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../tools/ui_tools/custom_appbar.dart';
import '../../../../tools/ui_tools/custom_scaffold.dart';
import '../../../../tools/ui_tools/loader_widget.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'إحصائيات',
        iconData: FontAwesomeIcons.chartPie,
      ),
      body: Center(
        child: LoaderWidget(),
      ),
    );
  }
}

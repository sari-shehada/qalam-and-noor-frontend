import 'package:flutter/material.dart';

import '../../../configs/project_themes.dart';
import '../../../tools/ui_tools/ui_tools.dart';
import 'widgets/home_page_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(flex: 3, child: TextField()),
                Expanded(flex: 1, child: Text('asd'))
              ],
            ),
            const AddVerticalSpacing(value: 30),
            Text(
              'مرحباً, محمد',
              style: TextStyle(fontSize: 40, color: lightColorScheme.secondary),
            ),
            const AddVerticalSpacing(value: 30),
            GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) => const HomePageCard(),
            )
          ],
        ),
      ),
    );
  }
}

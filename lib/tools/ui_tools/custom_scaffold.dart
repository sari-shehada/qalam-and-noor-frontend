import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bodyPadding = EdgeInsets.zero,
    this.floatingActionButton,
    this.bottomSection,
    this.backgroundColor,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final EdgeInsetsGeometry bodyPadding;
  final Widget? floatingActionButton;
  final Widget? bottomSection;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: SizedBox.expand(
          child: Padding(
        padding: bodyPadding,
        child: body,
      )),
      bottomNavigationBar: bottomSection,
    );
  }
}

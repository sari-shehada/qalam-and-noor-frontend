import 'package:flutter/material.dart';

class AddVerticalSpacing extends StatelessWidget {
  const AddVerticalSpacing({super.key, required this.value});

  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class AddHorizontialSpacing extends StatelessWidget {
  const AddHorizontialSpacing({super.key, required this.value});

  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kalam_noor/configs/fonts.dart';

class HintedTextField extends StatelessWidget {
  const HintedTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.textAlign = TextAlign.start,
      this.fillColor});

  final String hintText;
  final TextEditingController controller;
  final TextAlign textAlign;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        // counterText: containsLetterCount ? null : '',
        hintText: hintText,
        hintStyle: ProjectFonts.titleMedium,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        //TODO: Change based on seed color
        fillColor: fillColor ?? const Color(0xFFE3E3E3),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalStyles {
  static double globalBorderRadius = 15.r;
  static List<Color> miscColors = [
    const Color(0xFFBB6BCD),
    const Color(0xFF935ACC),
    const Color(0xFF8B79EB),
    const Color(0xFF899EE8),
    const Color(0xFF3983D2),
    const Color(0xFFA5D9FD),
    const Color(0xFF76B6D2),
    const Color(0xFF94DADC),
    const Color(0xFF64D1AE),
    const Color(0xFF62C378),
    const Color(0xFF4EA337),
    const Color(0xFF76CE38),
    const Color(0xFFDAEC39),
    const Color(0xFFFAE739),
    const Color(0xFFF3AF2F),
    const Color(0xFFEE7B28),
    const Color(0xFFEA3A22),
  ];

  static Color getMiscColor(int index) {
    return miscColors[index % miscColors.length];
  }
}

import 'package:flutter/material.dart';

class CustomColors {
  static const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);

  static const Color primaryText = Color(0xFF0F2027);
  static const Color secondaryText = Color(0xFF808080);
  static const Color tertiaryText = Color(0xFFBDBDBD);

  static const Color primaryRed = Color(0xFFAC0A28);
  static const Color secondaryRed = Color(0xFFE56A60);
  static const Color darkBlue = Color(0xFF2b2e4a);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
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

final Color color = HexColor.fromHex('#01679a');
// Map<int, Color> color2 = {
//   50: Color.fromRGBO(136, 14, 79, .1),
//   100: Color.fromRGBO(136, 14, 79, .2),
//   200: Color.fromRGBO(136, 14, 79, .3),
//   300: Color.fromRGBO(136, 14, 79, .4),
//   400: Color.fromRGBO(136, 14, 79, .5),
//   500: Color.fromRGBO(136, 14, 79, .6),
//   600: Color.fromRGBO(136, 14, 79, .7),
//   700: Color.fromRGBO(136, 14, 79, .8),
//   800: Color.fromRGBO(136, 14, 79, .9),
//   900: Color.fromRGBO(136, 14, 79, 1),
// };
Color carColor2 = Colors.green;
Color carColor = HexColor.fromHex("#aa0951");
Color bottomNavTextColor = HexColor.fromHex("#300317");

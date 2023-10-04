import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color primaryColor = hexToColor('#49274A');
  static Color primaryLight = hexToColor('#94618E');
  static Color secondaryDark = hexToColor('#F4DECB');
  static Color secondaryColor = hexToColor("#F8EEE7");
  static Color grey = hexToColor("#F4F2FD");
  static Color whiteText = hexToColor("#FEFEFE");
  static Color black = Colors.black;
}

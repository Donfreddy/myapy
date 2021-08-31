import 'package:flutter/material.dart';
import 'package:mypay/utils/helpers/hex_color.dart';

class AppColor {
  static const MaterialColor materialColor = MaterialColor(
    0xFF252B63,
    <int, Color>{
      50: Color.fromRGBO(60, 120, 223, .1),
      100: Color.fromRGBO(60, 120, 223, .2),
      200: Color.fromRGBO(60, 120, 223, .3),
      300: Color.fromRGBO(60, 120, 223, .4),
      400: Color.fromRGBO(60, 120, 223, .5),
      500: Color.fromRGBO(60, 120, 223, .6),
      600: Color.fromRGBO(60, 120, 223, .7),
      700: Color.fromRGBO(60, 120, 223, .8),
      800: Color.fromRGBO(60, 120, 223, .9),
      900: Color.fromRGBO(60, 120, 223, 1),
    },
  );

  static Color white = HexColor('#FFFFFF');
  static Color mainColor = HexColor('#252B63');
  static Color black = HexColor('#000000');

  static const Color headerCircle = Color.fromRGBO(255, 255, 255, 0.17);

  static Color red = HexColor('#C0030A');
  static Color yellow = HexColor('#DB9F2C');
  static Color gray = HexColor('#4C4B4E');
  static Color gray2 = HexColor('#696E73');
  static Color gray3 = HexColor('#9CAFBB');
  static Color gray6 = HexColor('#F2F2F2');
}

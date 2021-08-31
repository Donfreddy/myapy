import 'package:flutter/material.dart';

const Map<String, Color> colors_list = {
  "pulpe": Color(0xFF252B63),
  "orange": Color(0xFFF2994A),
  "green": Color(0xFF219653),
  "red": Color(0xFFEB5757),
  "blue": Color(0xFF2F80ED),
};

extension ColorSearchExtension on Color {
  // Search key from color_list
  String get getColorString =>
      colors_list.entries.firstWhere((element) => element.value == this).key;
}

extension ColorConvertExtension on String {
  Color get getColor {
    final color = colors_list[this];
    if (color == null) {
      return Color(0xFF252B63);
    } else {
      return color;
    }
  }
}

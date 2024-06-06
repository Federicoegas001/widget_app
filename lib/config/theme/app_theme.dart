import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.pink,
  Colors.green,
  Colors.grey,
  Colors.pinkAccent,
  Colors.brown,
  Colors.amberAccent,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor > 0, 'Tiene que ser mayor a 0'),
        assert(selectedColor <= colors.length,
            'Tiene que ser menor o igual a ${colors.length - 1}');

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colors[selectedColor]);
}

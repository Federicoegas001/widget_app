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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Tiene que ser mayor a 0'),
        assert(selectedColor <= colors.length,
            'Tiene que ser menor o igual a ${colors.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colors[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

//Estado => isDarkModeProvider = boolean
final isDarkModeProvider = StateProvider<bool>(
    (ref) => false); //StateProvider para tener una pieza de estado

// un simple int
final selectedColorProvider =
    StateProvider((ref) => 0); //StateProvider para tener una pieza de estado

// Listado de colores inmutable
final colorListProvider = Provider((ref) =>
    colors); // provider sirve para valores que sabes que no se van a cambiar

// un objeto de tipo AppTheme(custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/provider/theme_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedColor = ref.watch(selectedColorProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode)
          .getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}

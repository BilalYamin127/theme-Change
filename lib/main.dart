import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mode_controller/home_screen.dart';
import 'package:mode_controller/provider/theme_provider.dart';

import 'package:mode_controller/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    var themeMode = ref.watch(modeChangeProvider).thememode;

    return MaterialApp(
      theme: themeMode == ThemeMode.light
          ? AppTheme.lightThemeCopy
          : AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}

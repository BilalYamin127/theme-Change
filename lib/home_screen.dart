import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mode_controller/provider/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final modeProvider = ref.watch(modeChangeProvider.notifier);
    final isDarkMode = ref.watch(modeChangeProvider).isDarkMode ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mode change App',
            style: Theme.of(context).textTheme.displayLarge),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              if (value) {
                modeProvider.setDarkMode();
              } else {
                modeProvider.setLightMode();
              }
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: isDarkMode
              ? const Color.fromARGB(255, 218, 33, 33)
              : Colors.blue, // Adjust colors based on dark mode
        ),
      ),
    );
  }
}

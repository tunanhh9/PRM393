import 'package:flutter/material.dart';
import 'package:prm393_project/main.dart';

/// Exercise 4 - App Structure with Scaffold, AppBar, FAB & Theme.
class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeNotifier.value == ThemeMode.dark;

    // Scaffold provides the full screen structure: AppBar + body + FAB.
    return Scaffold(
      appBar: AppBar(
        // Color comes from the active ThemeData, so it follows Dark Mode.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Exercise 4 - App Structure'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('FAB pressed this many times:'),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              // Dark Mode toggle: updates themeMode of the whole app.
              SwitchListTile(
                title: const Text('Dark Mode'),
                secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    themeNotifier.value =
                        value ? ThemeMode.dark : ThemeMode.light;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter++),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

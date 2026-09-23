import 'package:flutter/material.dart';
import 'package:prm393_project/Screens/app_structure_demo.dart';
import 'package:prm393_project/Screens/core_widgets_demo.dart';
import 'package:prm393_project/Screens/debug_fixes_demo.dart';
import 'package:prm393_project/Screens/input_controls_demo.dart';
import 'package:prm393_project/Screens/layout_basics_demo.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Center(child: const Text('Homepage')),
        leading: Icon(Icons.menu),
        actions: [
          TextButton(
            style: ButtonStyle(),
            onPressed: () {},
            child: Text('Login'),
          ),
        ],
      ),
      // body: Center(
      //   child: RichText(
      //     text: TextSpan(
      //         text:'Hello',
      //         style: TextStyle(fontSize: 15, color: Colors.greenAccent),
      //         children: [
      //           TextSpan(
      //               text:'every',
      //               style: TextStyle(fontSize: 30, color: Colors.redAccent)),
      //           TextSpan(
      //               text:'one',
      //               style: TextStyle(fontSize: 15, color: Colors.greenAccent))
      //         ]
      //     ),
      //   ),
      // )
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoreWidgetsDemo(),
                  ),
                );
              },
              child: const Text('Exercise 1 - Core Widgets Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputControlsDemo(),
                  ),
                );
              },
              child: const Text('Exercise 2 - Input Controls Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LayoutBasicsDemo(),
                  ),
                );
              },
              child: const Text('Exercise 3 - Layout Basics Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppStructureDemo(),
                  ),
                );
              },
              child: const Text('Exercise 4 - App Structure Demo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DebugFixesDemo(),
                  ),
                );
              },
              child: const Text('Exercise 5 - Debug & Fix UI Errors'),
            ),
          ],
        ),
      ),
    );
  }
}

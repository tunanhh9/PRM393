import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/layout_basics_content.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('Exercise 3 - Layout Basics'),
      ),
      body: const LayoutBasicsContent(),
    );
  }
}

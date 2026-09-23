import 'package:flutter/material.dart';

/// Exercise 3 - Layout Basics: Column, Row, Padding, ListView.
/// Builds a sectioned layout similar to a real app Home screen.
class LayoutBasicsContent extends StatelessWidget {
  const LayoutBasicsContent({super.key});

  static const List<String> movieTitles = [
    'Inception',
    'Interstellar',
    'The Dark Knight',
    'Avatar',
    'Titanic',
    'The Matrix',
    'Parasite',
    'Oppenheimer',
    'Dune: Part Two',
    'Spirited Away',
  ];

  @override
  Widget build(BuildContext context) {
    // Column creates the vertical sections of the screen.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header section, spaced with Padding (16 px).
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Now Showing',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),

        // Category section laid out horizontally with Row.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Chip(avatar: Icon(Icons.local_fire_department), label: Text('Hot')),
              Chip(avatar: Icon(Icons.star), label: Text('Top rated')),
              Chip(avatar: Icon(Icons.upcoming), label: Text('Coming soon')),
            ],
          ),
        ),

        // Consistent spacing between sections with SizedBox (12 px).
        const SizedBox(height: 12),

        // ListView.builder shows the movie list.
        // Expanded gives the list a bounded height inside the Column.
        Expanded(
          child: ListView.builder(
            itemCount: movieTitles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.movie),
                    title: Text(movieTitles[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

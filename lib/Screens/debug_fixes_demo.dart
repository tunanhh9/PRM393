import 'package:flutter/material.dart';

/// Exercise 5 - Debug & Fix Common UI Errors.
/// Each section demonstrates a common Flutter UI bug and its fix:
///  1. ListView inside Column  -> fixed with Expanded.
///  2. Overflow on small screens -> fixed with SingleChildScrollView.
///  3. UI not updating           -> fixed by calling setState().
///  4. DatePicker context error  -> fixed by calling it from a State's
///     context that lives inside the MaterialApp widget tree.
class DebugFixesDemo extends StatefulWidget {
  const DebugFixesDemo({super.key});

  @override
  State<DebugFixesDemo> createState() => _DebugFixesDemoState();
}

class _DebugFixesDemoState extends State<DebugFixesDemo> {
  int likeCount = 0;
  DateTime? pickedDate;
  final List<String> items = List.generate(10, (i) => 'Item ${i + 1}');

  Future<void> pickDate() async {
    // Fix 4: showDatePicker is called from this State's context, which is
    // a valid descendant of MaterialApp, so the dialog builds correctly.
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('Exercise 5 - Debug & Fix UI Errors'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fix 1 - ListView inside Column (Expanded)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // Fix 1: a ListView inside a Column throws an "unbounded height"
          // error; wrapping it in Expanded gives it a bounded height.
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(items[index]),
                );
              },
            ),
          ),
          const Divider(height: 1),
          // Fix 2: this bottom panel can overflow on small screens, so its
          // content is wrapped in a SingleChildScrollView.
          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fix 3 - Update UI with setState()',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('Likes: $likeCount',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        // Fix 3: without setState() the counter would change
                        // internally but the UI would never rebuild.
                        onPressed: () => setState(() => likeCount++),
                        icon: const Icon(Icons.thumb_up),
                        label: const Text('Like'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Fix 4 - DatePicker from valid context',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pickedDate == null
                        ? 'No date selected'
                        : 'Selected: ${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: pickDate,
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('Pick a date'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

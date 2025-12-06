// This is an example file (usually in example/lib/main.dart)
import 'package:flutter/material.dart';
import 'package:proper_multiselect_search_dropdown/propermultiselectsearchdropdown/propermultiselect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Select Dropdown Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Select Dropdown Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example 1: Title Only (Single Value)
              const Text(
                '1. Title Only (Single Value):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ProperMultiSelectDropdown(
                items: const [
                  ['CAR001'],
                  ['TRUCK002'],
                  ['BIKE003'],
                  ['VAN004'],
                  ['MOTORCYCLE005'],
                ],
                hintText: 'Select Vehicles',
                titleTextStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                onSelectionChanged: (selectedItems) {
                  print('Selected: $selectedItems');
                },
              ),

              const SizedBox(height: 32),

              // Example 2: Title + Subtitle (Dual Value) - Inline
              const Text(
                '2. Title + Subtitle (Inline):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ProperMultiSelectDropdown(
                items: const [
                  ['CAR001', '\$ 25,000'],
                  ['TRUCK002', '\$ 45,000'],
                  ['BIKE003', '\$ 8,000'],
                  ['VAN004', '\$ 35,000'],
                  ['MOTORCYCLE005', '\$ 12,000'],
                ],
                hintText: 'Select Vehicles with Price',
                showSubtitleBelow: false, // Inline (default)
                titleSubtitleSeparator: ' - ', // Custom separator
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors. black87,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors. green,
                  fontWeight: FontWeight.bold,
                ),
                onSelectionChanged: (selectedItems) {
                  print('Selected: $selectedItems');
                },
              ),

              const SizedBox(height: 32),

              // Example 3: Title + Subtitle (Two Lines)
              const Text(
                '3. Title + Subtitle (Two Lines):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ProperMultiSelectDropdown(
                items: const [
                  ['MacBook Pro', '\$ 2,499'],
                  ['iPhone 15 Pro', '\$ 999'],
                  ['iPad Air', '\$ 599'],
                  ['Apple Watch', '\$ 399'],
                ],
                hintText: 'Select Products',
                showSubtitleBelow: true, // Two-line layout
                titleTextStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors. black,
                  fontWeight: FontWeight.bold,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors. blue,
                  fontStyle: FontStyle.italic,
                ),
                highlightedTitleTextStyle: TextStyle(
                  fontSize: 15,
                  backgroundColor: Colors.yellow[300],
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                highlightedSubtitleTextStyle: TextStyle(
                  fontSize: 13,
                  backgroundColor: Colors.orange[200],
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                onSelectionChanged: (selectedItems) {
                  print('Selected: $selectedItems');
                },
              ),

              const SizedBox(height: 32),

              // Example 4: Custom Separator
              const Text(
                '4. Custom Separator (|):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ProperMultiSelectDropdown(
                items: const [
                  ['Small', '10-20 items'],
                  ['Medium', '20-50 items'],
                  ['Large', '50-100 items'],
                  ['Extra Large', '100+ items'],
                ],
                hintText: 'Select Size',
                titleSubtitleSeparator: ' | ', // Custom separator
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                checkboxPosition: ListTileControlAffinity.trailing, // Right side
                checkboxActiveColor: Colors.purple,
                onSelectionChanged: (selectedItems) {
                  print('Selected: $selectedItems');
                },
              ),

              const SizedBox(height: 32),

              // Example 5: Mixed (Some with subtitle, some without) - NOT RECOMMENDED but supported
              const Text(
                '5.  Fully Customized with Highlight:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ProperMultiSelectDropdown(
                items: const [
                  ['Diamond Plan', '\$ 99/month'],
                  ['Gold Plan', '\$ 49/month'],
                  ['Silver Plan', '\$ 29/month'],
                  ['Bronze Plan', '\$ 9/month'],
                ],
                hintText: 'Choose your plan',
                selectedItemText: '{count} plan(s) selected',
                showSubtitleBelow: true,

                // Styling
                titleTextStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors. black,
                  fontWeight: FontWeight.w700,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
                highlightedTitleTextStyle: TextStyle(
                  fontSize: 16,
                  backgroundColor: Colors.yellow[200],
                  fontWeight: FontWeight.w900,
                  color: Colors. red,
                ),
                highlightedSubtitleTextStyle: TextStyle(
                  fontSize: 14,
                  backgroundColor: Colors.green[200],
                  fontWeight: FontWeight.bold,
                  color: Colors. green[900],
                ),

                // Colors
                backgroundColor: Colors.blue[50],
                borderColor: Colors.blue,
                checkboxActiveColor: Colors.orange,

                onSelectionChanged: (selectedItems) {
                  print('Selected: $selectedItems');
                },
              ),

              const SizedBox(height: 24),
              const Text(
                'Check the console for selected items',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
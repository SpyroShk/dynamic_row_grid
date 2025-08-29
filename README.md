# Dynamic Row Grid

DynamicRowGrid is a highly customizable and flexible Flutter package designed to create dynamic, responsive grids of items with ease. It offers a wide range of configuration options to meet various UI needs, making it an ideal choice for developers looking to create visually appealing and functionally robust grid layouts in their applications.

<img src="https://github.com/SpyroShk/dynamic_row_grid/raw/main/screenshot/grid.gif" width="200">

## Features

- Flexible Item Count: Dynamically configure the number of items per row using the crossAxisCount property.
- Custom Item Builder: Use a custom itemBuilder function to generate each item in the grid, providing maximum flexibility in item rendering.
- Spacing Control: Easily adjust horizontal and vertical spacing between items with horizontalSpacing and verticalSpacing.
- Custom Alignment: Align items within each row using the alignment property, supporting various alignment options.
- Padding and Margins: Customize padding around the grid and margins between rows to fit your design needs.
- Scrollable Grid: Utilize scrollable grids with custom scroll physics and controllers.
- Shrink-Wrap Support: Enable or disable shrink-wrap behavior to optimize performance based on your layout requirements.
- Grid Decorations: Apply custom decorations the entire grid using gridDecoration.
- Header and Footer: Add optional header and footer widgets to the grid for additional context or functionality.
- Empty State Handling: Display a custom widget when the grid is empty using the emptyStateWidget property.

## Getting started

1. Install the Package: Add dynamic_row_grid to your pubspec.yaml dependencies.

   ```yaml
   dependencies:
     dynamic_row_grid: ^0.0.3
   ```

2. Import the Package: Include the package in your Dart code with import 'package:dynamic_row_grid/dynamic_row_grid.dart';.

   ```dart
   import 'package:dynamic_row_grid/dynamic_row_grid.dart';
   ```

3. Use the Widget: Integrate the DynamicRowGrid widget into your layout and customize it as needed.

## Usage

Customizable Properties in DynamicRowGrid

- itemCount
- itemBuilder
- crossAxisCount
- horizontalSpacing
- verticalSpacing
- alignment
- physics
- controller
- shrinkWrap
- padding
- gridDecoration
- header
- footer
- emptyStateWidget

<hr>

```dart
final List animals = [
  'Lion',
  'Tiger',
  'Elephant',
  'Giraffe',
  ...
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: DynamicRowGrid(
            // horizontalScroll: true,
            alignment: Alignment.centerLeft,
            itemCount: animals.length,
            crossAxisCount: 10,
            physics: const BouncingScrollPhysics(),
            // horizontalSpacing: 0,
            // verticalSpacing: 0,
            header: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Animals',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            footer: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Footer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            emptyStateWidget: const Center(
              child: Text(
                'No animals available',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  animals[index],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

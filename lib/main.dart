import 'package:flutter/material.dart';
import 'package:yaraui/yaraui.dart';

void main() => YaraUI.init(
  app: const MainApp(),
  window: const .new(title: 'Stormbird'),
);

/// The main application widget.
class MainApp extends StatelessWidget {
  /// Creates a new [MainApp] widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaraApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

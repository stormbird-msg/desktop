import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yaraui/yaraui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await YaraUI.init(
    app: const MainApp(),
    window: const .new(title: 'Stormbird'),
  );
}

/// The main application widget.
class MainApp extends StatefulWidget {
  /// Creates a new [MainApp] widget.
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    unawaited(_controller.load(.parse('https://softyes.com.br')));
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YaraApp(
    debugShowCheckedModeBanner: false,
    home: Center(child: WebView(controller: _controller)),
  );
}

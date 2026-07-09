import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stormbird/ui/widgets/webview.dart';
import 'package:webview_cef/webview_cef.dart';
import 'package:yaraui/yaraui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await WebviewManager().initialize(userAgent: 'Chrome/149.0.0.0');
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
  @override
  void dispose() {
    unawaited(WebviewManager().quit());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YaraApp(
      debugShowCheckedModeBanner: false,
      home: const Center(child: Webview()),
    );
  }
}

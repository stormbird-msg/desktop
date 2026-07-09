import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_cef/webview_cef.dart';

/// A widget that displays a web page.
class Webview extends StatefulWidget {
  /// Creates a new [Webview] widget.
  const Webview({super.key});

  @override
  State<StatefulWidget> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebviewManager().createWebView(
      injectUserScripts: InjectUserScripts(),
    );

    unawaited(_controller.initialize('https://softyes.com.br'));
    if (kDebugMode) _controller.addListener(_openDevTools);
  }

  @override
  void dispose() {
    if (kDebugMode) _controller.removeListener(_openDevTools);
    unawaited(_controller.dispose());
    super.dispose();
  }

  void _openDevTools() {
    if (_controller.value) unawaited(_controller.openDevTools());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _controller,
      builder: (_, ready, _) {
        if (ready) return _controller.webviewWidget;
        return const SizedBox.shrink();
      },
    );
  }
}

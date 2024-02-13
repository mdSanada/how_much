import 'package:flutter/material.dart';
import 'package:how_much/core/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../design/stylesheet.dart';
import '../../widgets/title.app.bar.dart';

class CustomWebView extends StatefulWidget {
  final String title;
  final String url;

  const CustomWebView({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {});
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            Logger.log(request.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        backButtonEnabled: false,
        title: widget.title,
        highlightColor: Stylesheet.primaryColor,
      ),
      backgroundColor: Stylesheet.backgroundColor,
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

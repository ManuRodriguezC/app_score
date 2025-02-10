import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNew extends StatefulWidget {
  final String url;
  static const name = 'new-page';
  const WebViewNew({super.key, required this.url});

  @override
  State<WebViewNew> createState() => _WebViewNewState();
}

class _WebViewNewState extends State<WebViewNew> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarCustom(principal: false),
        body: WebViewWidget(controller: controller),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }
}

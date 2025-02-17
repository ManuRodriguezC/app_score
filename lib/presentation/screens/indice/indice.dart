import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IndicePage extends StatefulWidget {
  static const name = 'indice-page';
  const IndicePage({super.key});

  @override
  State<IndicePage> createState() => _IndicePageState();
}

class _IndicePageState extends State<IndicePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse("https://score-urosario.shinyapps.io/SCORE_MOVIL/"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarCustom(principal: true),
        drawer: const CustomDrawer(),
        body: WebViewWidget(controller: controller),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }
}
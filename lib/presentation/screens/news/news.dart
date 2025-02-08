import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';

class NewsPage extends StatelessWidget {
  static const name = 'news-page';
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: Text("Eventos")),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

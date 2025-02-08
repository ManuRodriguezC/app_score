import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';

class IndicePage extends StatelessWidget {
  static const name = 'indice-page';
  const IndicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: Text("Indices")),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

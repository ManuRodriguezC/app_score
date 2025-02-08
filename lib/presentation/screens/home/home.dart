import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/carousel/carousel.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Score App"),
          backgroundColor: const Color.fromARGB(255, 127, 191, 170),
        ),
        body: Column(
          children: [
            Expanded(child: CarouselState()),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }
}

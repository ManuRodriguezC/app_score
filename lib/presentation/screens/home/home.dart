import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/carousel/carousel.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarCustom(principal: true),
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

import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/HomeScroll/home_scroll.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(principal: true),
        drawer: CustomDrawer(),
        body: HomeScroll(),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';
import 'package:score_rosario/presentation/widgets/news/list_news.dart';

class NewsPage extends StatelessWidget {
  static const name = 'news-page';
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(principal: true),
        drawer: CustomDrawer(),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Noticias Rosario",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 127, 191, 170)),
            ),
          ),
          Expanded(child: ListNews()),
        ]),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

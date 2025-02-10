import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
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
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Noticias Rosario",
              style: TextStyle(
                  fontSize: 25,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0), // Desplazamiento en X y Y
                      blurRadius: 4.0, // Desenfoque de la sombra
                      color: Colors.black, // Color de la sombra
                    ),
                  ],
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

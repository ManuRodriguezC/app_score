import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';
import 'package:score_rosario/presentation/widgets/events/list_events.dart';

class EventsPage extends StatelessWidget {
  static const name = 'events-page';
  const EventsPage({super.key});

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
              "Eventos Rosario",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 127, 191, 170)),
            ),
          ),
          Expanded(child: ListEvents()),
        ]),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

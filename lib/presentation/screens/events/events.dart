import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/event.dart';
import 'package:score_rosario/infrastructure/datasource/notificationsdb_datasource.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/events/list_events.dart';

class EventsPage extends StatelessWidget {
  static const name = 'events-page';
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsdbDatasource eventsService = NotificationsdbDatasource();

    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(principal: true),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Eventos Rosario",
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
          Expanded(child: ListEvents()),
        ]),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';

class EventsPage extends StatelessWidget {
  static const name = 'events-page';
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: Text("Noticias")),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

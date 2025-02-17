import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/event.dart';
import 'package:score_rosario/infrastructure/datasource/notificationsdb_datasource.dart';
import 'package:score_rosario/presentation/widgets/events/event_card.dart';

class ListEvents extends StatelessWidget {
  const ListEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsdbDatasource newsService = NotificationsdbDatasource();

    return FutureBuilder<List<Event>>(
      future: newsService.getEvents(), // 🔹 Llama al método getNews()
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // 🔄 Muestra un loader
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset("assets/images/notfound.png"),
                const Text("Error, revisa la conexión a tu red."),
              ])); // ❌ Muestra el error si hay
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text("No hay noticias disponibles")); // 📭 Si no hay datos
        }

        final events = snapshot.data!; // ✅ Obtitrue, titlela lista de noticias

        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventCard(
              eventItem: events[index],
            );
          },
        );
      },
    );
  }
}

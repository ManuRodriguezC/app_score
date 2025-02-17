import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/new.dart';
import 'package:score_rosario/infrastructure/datasource/notificationsdb_datasource.dart';
import 'package:score_rosario/presentation/widgets/news/new_card.dart';

class ListNews extends StatelessWidget {
  const ListNews({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsdbDatasource newsService = NotificationsdbDatasource();

    return FutureBuilder<List<New>>(
      future: newsService.getNews(), // 🔹 Llama al método getNews()
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

        final news = snapshot.data!; // ✅ Obtiene la lista de noticias

        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewCard(
              newItem: news[index],
            );
          },
        );
      },
    );
  }
}

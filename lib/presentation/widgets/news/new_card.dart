import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:score_rosario/domain/entities/new.dart';

class NewCard extends StatelessWidget {
  final New newItem;

  const NewCard({super.key, required this.newItem});

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(30, 127, 191, 170),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 127, 191, 170),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  newItem
                      .imagen, // ✅ Cambia newItem.imagen por widget.newItem.imagen
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            Text(
              newItem.titulo,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              newItem.parrafo,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.justify,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final encodedUrl = Uri.encodeComponent(newItem.url);
                context.push('/new_view/$encodedUrl');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 22, 130, 72), // Color de fondo
                foregroundColor: Colors.white, // Color del texto
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 6), // Espaciado interno
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
              ),
              child: const Text("Leer más"),
            )
          ],
        ),
      ),
    );
  }
}

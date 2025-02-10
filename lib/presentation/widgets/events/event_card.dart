import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/event.dart';

class EventCard extends StatelessWidget {
  final Event eventItem;

  const EventCard({super.key, required this.eventItem});

  String _setDate(String value) {
    final splitValue = value.split("T");
    return '${splitValue[0]}';
  }

  String _setHour(String value) {
    final splitValue = value.split("T");
    return splitValue[1].toString().replaceFirst(RegExp(r'Z$'), '');
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  eventItem
                      .imagen, // ✅ Cambia eventItem.imagen por widget.eventItem.imagen
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            Text(
              eventItem.titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            const Text("Lugar:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            Text(
              eventItem.lugar,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Fecha:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text(
                    _setDate(eventItem.fecha),
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(width: 130),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hora:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text(
                    _setHour(eventItem.fecha),
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              )
            ]),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 77, 54, 191), // Color de fondo
                foregroundColor: Colors.white, // Color del texto
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 6), // Espaciado interno
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
              ),
              child: const Text("Agregar al Calendario"),
            )
          ],
        ),
      ),
    );
  }
}

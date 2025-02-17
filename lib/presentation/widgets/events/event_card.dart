import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/event.dart';
import 'package:add_2_calendar/add_2_calendar.dart' as AddEvent;
import 'package:shared_preferences/shared_preferences.dart';

class EventCard extends StatefulWidget {
  final Event eventItem;

  const EventCard({super.key, required this.eventItem});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool agregated = false;

  @override
  void initState() {
    super.initState();
    _verificationExists();
  }

  Future<void> _verificationExists() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      agregated = prefs.getBool('evento_${widget.eventItem.titulo}') ?? false;
    });
  }

  Future<void> _guardarEstadoAgregado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('evento_${widget.eventItem.titulo}', true);
  }

  DateTime _parseDateTime(String dateTimeString) {
    try {
      return DateTime.parse(dateTimeString).toLocal();
    } catch (e) {
      return DateTime.now();
    }
  }

  void agregarEvento() {
    final DateTime start = _parseDateTime(widget.eventItem.fecha);
    final DateTime end = start.add(const Duration(hours: 2));

    final AddEvent.Event event = AddEvent.Event(
      title: widget.eventItem.titulo,
      description: widget.eventItem.parrafo,
      location: widget.eventItem.lugar,
      startDate: start,
      endDate: end,
      allDay: false,
    );

    AddEvent.Add2Calendar.addEvent2Cal(event).then((_) {
      _guardarEstadoAgregado();
      setState(() {
        agregated = true;
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al agregar el evento: $e")),
      );
    });
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.eventItem.imagen,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.eventItem.titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Fecha:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.eventItem.fecha.split("T")[0]),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hora:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.eventItem.fecha
                        .split("T")[1]
                        .replaceFirst(RegExp(r'Z\$'), '')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: agregarEvento,
              style: ElevatedButton.styleFrom(
                backgroundColor: agregated
                    ? Colors.grey
                    : const Color.fromARGB(255, 77, 54, 191),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(agregated ? "Agregado" : "Agregar al Calendario"),
            ),
          ],
        ),
      ),
    );
  }
}

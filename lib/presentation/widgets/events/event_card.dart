import 'package:flutter/material.dart';
import 'package:score_rosario/domain/entities/event.dart';
import 'package:device_calendar/device_calendar.dart' as addCalendar;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class EventCard extends StatefulWidget {
  final Event eventItem;

  const EventCard({super.key, required this.eventItem});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool agregated = false;
  final addCalendar.DeviceCalendarPlugin _deviceCalendarPlugin =
      addCalendar.DeviceCalendarPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
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

  Future<void> solicitarPermisos() async {
    if (await Permission.calendar.isDenied) {
      await Permission.calendar.request();
    }
  }

  DateTime _parseDateTime(String dateTimeString) {
    try {
      return DateTime.parse(dateTimeString)
          .toLocal(); // Asegura que sea en hora local
    } catch (e) {
      print("Error al convertir la fecha: $e");
      return DateTime.now(); // Usa la fecha actual en caso de error
    }
  }

  tz.TZDateTime _convertToTZDateTime(DateTime dateTime) {
    final location = tz.getLocation(
        'America/Bogota'); // Ajusta según tu zona horaria
    return tz.TZDateTime.from(dateTime, location);
  }

  Future<void> agregarEvento() async {
    try {
      await solicitarPermisos();
      var calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      
      final DateTime start = _parseDateTime(widget.eventItem.fecha);
      final DateTime end = start.add(const Duration(hours: 2));

      final tz.TZDateTime tzStart = _convertToTZDateTime(start);
      final tz.TZDateTime tzEnd = _convertToTZDateTime(end);
      
      if (calendarsResult.isSuccess && calendarsResult.data!.isNotEmpty) {
        final calendarId = calendarsResult.data!.first.id;
        final event = addCalendar.Event(
          calendarId,
          title: widget.eventItem.titulo,
          description: widget.eventItem.parrafo,
          location: widget.eventItem.lugar,
          start: tzStart,
          end: tzEnd,
        );
        final createEventResult =
            await _deviceCalendarPlugin.createOrUpdateEvent(event);
        if (createEventResult!.isSuccess) {
          _guardarEstadoAgregado();
          setState(() {
            agregated = true;
          });
        } else {
          throw Exception("No se pudo agregar el evento al calendario.");
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Fecha:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.eventItem.fecha.split("T")[0]),
                  ],
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

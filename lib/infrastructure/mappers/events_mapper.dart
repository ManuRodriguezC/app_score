import 'package:score_rosario/domain/entities/event.dart';
import 'package:score_rosario/infrastructure/models/eventsdb/eventsdb_response.dart';

class EventsMapper {
  static Event eventsDBToEntity(EventsDbResponse newdb) => Event(
      id: newdb.id,
      titulo: newdb.titulo,
      imagen: newdb.imagen,
      creadoPor: newdb.creadoPor,
      parrafo: newdb.parrafo,
      lugar: newdb.lugar,
      fecha: newdb.fecha
      );
}

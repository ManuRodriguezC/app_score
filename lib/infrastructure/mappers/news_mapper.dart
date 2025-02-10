import 'package:score_rosario/domain/entities/new.dart';
import 'package:score_rosario/infrastructure/models/newsdb/newsdb_response.dart';

class NewsMapper {
  static New newsDBToEntity(NewsDbResponse newdb) => New(
      id: newdb.id,
      titulo: newdb.titulo,
      imagen: newdb.imagen,
      creadoPor: newdb.creadoPor,
      parrafo: newdb.parrafo,
      url: newdb.url);
}

import 'package:score_rosario/domain/entities/event.dart';
import 'package:score_rosario/domain/entities/new.dart';

abstract class NotificationsDatasources {
  Future<List<New>> getNews();
  Future<List<Event>> getEvents();
}

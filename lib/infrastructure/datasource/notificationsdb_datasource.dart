import 'package:score_rosario/domain/datasources/notifications_datasources.dart';
import 'package:score_rosario/domain/entities/event.dart';
import 'package:score_rosario/domain/entities/new.dart';
import 'package:dio/dio.dart';
import 'package:score_rosario/infrastructure/mappers/events_mapper.dart';
import 'package:score_rosario/infrastructure/mappers/news_mapper.dart';
import 'package:score_rosario/infrastructure/models/eventsdb/eventsdb_response.dart';
import 'package:score_rosario/infrastructure/models/newsdb/newsdb_response.dart';

class NotificationsdbDatasource extends NotificationsDatasources {
  final dio = Dio(BaseOptions(
      baseUrl:
          "https://adminrosarioscore.pythonanywhere.com/notificaciones/api/v1/"));

  @override
  Future<List<New>> getNews() async {
    final response = await dio.get('noticias-score/');
    final List<dynamic> newsData = response.data;

    // Mapea cada item al modelo `New`
    final List<New> news = newsData
        .map((item) => NewsMapper.newsDBToEntity(NewsDbResponse.fromJson(item)))
        .toList();

    return news;
  }

  @override
  Future<List<Event>> getEvents() async {
    final response = await dio.get('eventos-score/');
    final List<dynamic> eventsData = response.data;

    // Mapea cada item al modelo `New`
    final List<Event> events = eventsData
        .map((item) =>
            EventsMapper.eventsDBToEntity(EventsDbResponse.fromJson(item)))
        .toList();

    return events;
  }
}

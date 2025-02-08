import 'package:go_router/go_router.dart';
import 'package:score_rosario/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage()),
  GoRoute(
      path: '/news',
      name: NewsPage.name,
      builder: (context, state) => const NewsPage()),
  GoRoute(
      path: '/indice',
      name: IndicePage.name,
      builder: (context, state) => const IndicePage()),
  GoRoute(
      path: '/events',
      name: EventsPage.name,
      builder: (context, state) => const EventsPage()),
]);

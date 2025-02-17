import 'package:go_router/go_router.dart';
import 'package:score_rosario/presentation/screens/news/new_page.dart';
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
  GoRoute(
    path: '/new_view/:url',
    name: WebViewNew.name,
    builder: (context, state) {
      final url = Uri.decodeComponent(state.pathParameters['url']!);
      return WebViewNew(url: url);
    },
  ),
  GoRoute(
      path: '/quienesSomos',
      name: QuienesSomos.name,
      builder: (context, state) => const QuienesSomos()),
  GoRoute(
      path: '/politicas',
      name: Politicas.name,
      builder: (context, state) => const Politicas()),
  GoRoute(
      path: '/ayuda',
      name: Ayuda.name,
      builder: (context, state) => const Ayuda())
]);

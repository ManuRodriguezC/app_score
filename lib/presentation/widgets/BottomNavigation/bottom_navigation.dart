import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/news');
      case 2:
        context.go('/indice');
      case 3:
        context.go('/events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 127, 191, 170),
      elevation: 0,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded), label: 'Noticias'),
        BottomNavigationBarItem(
            icon: Icon(Icons.grade_rounded), label: 'Indices'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded), label: 'Eventos'),
      ],
    );
  }
}

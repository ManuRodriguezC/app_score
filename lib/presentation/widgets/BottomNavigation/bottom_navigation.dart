import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:score_rosario/config/menu/menu.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String? location = GoRouterState.of(context).path;

    switch (location) {
      case '/':
        return 0;
      case '/news':
        return 1;
      case '/indice':
        return 2;
      case '/events':
        return 3;
      default:
        return 4;
    }
  }

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
    final int selectedIndex = getCurrentIndex(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 127, 191, 170),
      selectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 0,
      currentIndex: selectedIndex < appMenu.length - 1 ? selectedIndex : 0,
      onTap: (value) => onItemTapped(context, value),
      items: appMenu.asMap().entries.map((entry) {
        final int index = entry.key;
        final item = entry.value;

        return BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.data,
              size: 35,
              color: selectedIndex == index
                  ? const Color.fromARGB(255, 127, 191, 170)
                  : Colors.white,
            ),
          ),
          label: item.title,
        );
      }).toList(),
    );
  }
}

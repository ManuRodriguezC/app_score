import 'package:flutter/material.dart';

class Menu {
  final String title;
  final String link;
  final IconData data;

  const Menu({required this.title, required this.link, required this.data});
}

const appMenu = <Menu>[
  Menu(title: "Inicio", link: "/", data: Icons.menu_book_rounded),
  Menu(title: "Noticias", link: "/news", data: Icons.newspaper_rounded),
  Menu(title: "Indice", link: "/indice", data: Icons.read_more_rounded),
  Menu(title: "Eventos", link: "/events", data: Icons.calendar_month_rounded)
];

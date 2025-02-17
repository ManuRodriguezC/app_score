import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 127, 191, 170)),
              child: Image.asset("assets/images/logonegro.png")),
          _buildListWidget("Inicio", Icons.home_rounded, () {
            context.go('/');
          }),
          _buildListWidget("Noticias", Icons.newspaper_rounded, () {
            context.go('/news');
          }),
          _buildListWidget("Índices", Icons.bar_chart_rounded, () {
            context.go('/indice');
          }),
          _buildListWidget("Eventos", Icons.calendar_month_rounded, () {
            context.go('/events');
          }),
          _buildListWidget("Quienes Somos", Icons.people_alt_rounded, () {
            context.push('/quienesSomos');
          }),
          _buildListWidget("PolÍticas de Seguridad", Icons.balance_rounded, () {
            context.push('/politicas');
          }),
          _buildListWidget("Ayuda", Icons.help_center_rounded, () {
            context.push('/ayuda');
          }),
        ],
      ),
    );
  }

  Widget _buildListWidget(String title, IconData icon, VoidCallback onTap) {
    return Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 1))),
        child: ListTile(title: Text(title), leading: Icon(icon), onTap: onTap));
  }
}

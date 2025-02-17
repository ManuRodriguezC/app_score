import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';

class Politicas extends StatelessWidget {
  static const name = 'politicas';
  const Politicas({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(principal: true),
        drawer: CustomDrawer(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Políticas de Seguridad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 127, 191, 170)),
                ),
                SizedBox(height: 13),
                Text(
                  'En esta aplicación, no solicitamos ni almacenamos ningún dato personal. '
                  'Solo utilizamos las notificaciones para enviar alertas importantes sobre la app. '
                  'No se recopilan ni procesan datos personales de los usuarios para ningún otro propósito.\n\n'
                  'Al acceder a esta aplicación, autorizas el envío de notificaciones. '
                  'Puedes desactivar las notificaciones en cualquier momento desde la configuración de tu dispositivo.\n\n'
                  'Tu privacidad y seguridad son muy importantes para nosotros.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ))),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

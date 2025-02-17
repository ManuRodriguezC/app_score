import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';

class Ayuda extends StatelessWidget {
  static const name = 'ayuda';
  const Ayuda({super.key});

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
                  'Ayuda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 127, 191, 170)),
                ),
                SizedBox(height: 13),
                Text(
                  'Si encuentras alguna falla o problema al utilizar la aplicación, te invitamos a informarlo para que podamos resolverlo lo antes posible. Puedes enviar tus comentarios, dudas o sugerencias al equipo de soporte de la Universidad del Rosario a través del siguiente correo electrónico: soporte@urosario.edu.co.\n\n'
                  'Si necesitas más información o tienes preguntas adicionales sobre el servicio Score o cualquier otra funcionalidad de la app, también puedes contactar al área encargada a través del correo: score@urosario.edu.co.\n\n'
                  'Tu colaboración es muy valiosa para mejorar continuamente nuestra plataforma y brindarte una mejor experiencia.',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ))),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

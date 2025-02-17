import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/AppBar/app_bar_custom.dart';
import 'package:score_rosario/presentation/widgets/BottomNavigation/bottom_navigation.dart';
import 'package:score_rosario/presentation/widgets/drawer/drawer.dart';

class QuienesSomos extends StatelessWidget {
  static const name = 'quienesSomos';
  const QuienesSomos({super.key});

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
                  'Quienes Somos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 127, 191, 170)),
                ),
                SizedBox(height: 13),
                Text(
                  'La app Score de la Universidad del Rosario está diseñada para ofrecer a nuestra comunidad universitaria una herramienta accesible y eficiente para consultar información relevante sobre el servicio Score, una plataforma que recopila y presenta indicadores clave relacionados con el desempeño académico y administrativo de la universidad.\n\n'
                  'A través de esta app, los usuarios pueden visualizar gráficos y datos actualizados sobre diversos aspectos de la universidad, permitiendo un análisis claro y en tiempo real de los indicadores más importantes. Además, proporcionamos una experiencia interactiva donde los estudiantes, profesores y personal administrativo pueden mantenerse informados sobre eventos y noticias relevantes de la universidad.\n\n'
                  'La app también incluye notificaciones que mantienen a los usuarios al tanto de cualquier novedad, evento o actualización importante, asegurando que nunca se pierdan de los momentos más significativos en la vida universitaria.\n\n'
                  'Nuestra misión es acercar la información de la Universidad del Rosario a todos, de manera rápida y directa, fomentando un entorno académico más informado y conectado.',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ))),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}

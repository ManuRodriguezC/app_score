import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final bool principal;
  const AppBarCustom({super.key, required this.principal});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(140);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: widget.principal ? 120 : 90,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 127, 191, 170),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(38, 57, 77, 1),
                    blurRadius: 30,
                    spreadRadius: -10,
                    offset: Offset(
                      0,
                      5,
                    ),
                  ),
                ],
                borderRadius: widget.principal == true
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))
                    : BorderRadius.zero),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.principal == false
                    ? IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : Image.asset(
                        "assets/images/logonegro.png",
                        height: 50,
                      ),
                // Ícono de notificaciones
                const Icon(Icons.menu_rounded, color: Colors.white, size: 30),
              ],
            )),
        Positioned(
            bottom: 0,
            left: (MediaQuery.of(context).size.width / 2) - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: Image.asset(
                "assets/images/rosario.jpg",
                height: widget.principal ? 110 : 80,
                width: widget.principal ? 110 : 80,
                fit: BoxFit.cover,
              ),
            ))
      ],
    );
  }
}

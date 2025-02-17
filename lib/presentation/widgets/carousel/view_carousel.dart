import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/carousel/button.dart';

class ViewCarousel extends StatelessWidget {
  final String? title;
  final String subtitle;
  final String parraf;
  final String? image;
  final String? size;
  final VoidCallback onNextPage;
  final VoidCallback onBeforePage;
  final num currentPage;
  final bool end;

  const ViewCarousel({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.parraf,
    this.image,
    this.size,
    required this.onNextPage,
    required this.onBeforePage,
    required this.currentPage,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: (size?.isEmpty ?? true) ? 310 : (screenWidth),
                height: 240,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  "assets/images/$image",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(children: [
                  Padding(
                    padding: (title?.isEmpty ?? true
                        ? const EdgeInsets.only(bottom: 10)
                        : EdgeInsets.zero),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: (title?.isEmpty ?? true)
                              ? (screenWidth * 0.055)
                              : (screenWidth * 0.043),
                          color: Colors.black87,
                          fontFamily: 'Roboto',
                          fontWeight: (title?.isEmpty ?? true)
                              ? FontWeight.bold
                              : FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    parraf,
                    style: TextStyle(
                        fontSize: (title?.isEmpty ?? true)
                            ? (screenWidth * 0.04)
                            : (screenWidth * 0.075),
                        color: Colors.black45,
                        fontFamily: 'Roboto',
                        fontWeight: (title?.isEmpty ?? true)
                            ? FontWeight.w400
                            : FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ButtonPage(
            currentPage: currentPage,
            onNextPage: onNextPage,
            onBeforePage: onBeforePage,
            effect: end,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:score_rosario/datasource/info_carousel.dart';

class ButtonPage extends StatefulWidget {
  final num currentPage;
  final VoidCallback onNextPage;
  final VoidCallback onBeforePage;
  final bool effect;

  const ButtonPage(
      {Key? key,
      required this.currentPage,
      required this.onNextPage,
      required this.onBeforePage,
      required this.effect})
      : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  double _containerHeight = 80;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(bottom: 5, left: 25, right: 25),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: _containerHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.blueGrey,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 127, 191, 170),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: widget.onBeforePage,
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 32,
              ),
              color: Colors.white,
            ),
          ),
          Row(
            children: List.generate(pages.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(1.3),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 20),
                  margin: const EdgeInsets.all(3),
                  width: index == widget.currentPage ? 19 : 9.5,
                  height: 9.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: index == widget.currentPage
                        ? const Color.fromARGB(255, 127, 191, 170)
                        : Colors.white54,
                  ),
                ),
              );
            }),
          ),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 127, 191, 170),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: widget.onNextPage,
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 32,
              ),
              color: Colors.white,
            ),
          )
        ]));
  }
}

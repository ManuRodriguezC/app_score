import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:score_rosario/infrastructure/datasource/info_carousel.dart';

class HomeScroll extends StatefulWidget {
  const HomeScroll({super.key});

  @override
  State<HomeScroll> createState() => _HomeScrollState();
}

class _HomeScrollState extends State<HomeScroll> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  final title = page['subtitle']!;
                  final image = page['image']!;
                  final parraf = page['parraf']!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 300,
                          child: Image.asset(
                            "assets/images/$image",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.black87,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                parraf,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black45,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: pages.length,
          effect: const WormEffect(
            dotHeight: 20,
            dotWidth: 20,
            activeDotColor: Color.fromARGB(255, 127, 191, 170),
          ),
        ),
      ],
    );
  }
}

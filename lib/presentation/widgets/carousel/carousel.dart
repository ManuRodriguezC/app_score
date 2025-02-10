import 'package:flutter/material.dart';
import 'package:score_rosario/presentation/widgets/carousel/view_carousel.dart';
import 'package:score_rosario/infrastructure/datasource/info_carousel.dart';

class CarouselState extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<CarouselState> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _beforePage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentPage,
      children: pages.map((page) {
        return ViewCarousel(
            title: page['title'] ?? '',
            subtitle: page['subtitle'] ?? '',
            parraf: page['parraf'] ?? '',
            image: page['image'] ?? '',
            size: page['size'] ?? '',
            onNextPage: _nextPage,
            onBeforePage: _beforePage,
            end: page['end'] == "end" ? true : false,
            currentPage: _currentPage);
      }).toList(),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://www.rshabibie.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FHD.293cc9fd.jpg&w=3840&q=75',
  'https://www.rshabibie.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FPHD.d45cb866.jpg&w=3840&q=75',
  'https://www.rshabibie.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FPHDAnak.b55a7369.jpg&w=3840&q=75',
];

final themeMode = ValueNotifier(2);

class VerticalSliderDemo2 extends StatelessWidget {
  const VerticalSliderDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ],
      )),
))
    .toList();

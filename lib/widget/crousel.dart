import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List imagesList = [
    // Ink.image(image: const NetworkImage('assets/login.png')),
    'https://www.shutterstock.com/shutterstock/photos/1997252813/display_1500/stock-photo-curls-natural-hair-style-on-woman-1997252813.jpg',
    'https://www.shutterstock.com/shutterstock/photos/1665746980/display_1500/stock-photo-cute-fashion-girl-or-woman-with-beautiful-hair-and-skin-illustration-for-banner-of-beauty-1665746980.jpg',
    'https://www.shutterstock.com/shutterstock/photos/1997252804/display_1500/stock-photo-curls-natural-hair-style-on-woman-1997252804.jpg',
    // 'assets/images/kitty.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

      items:
      imagesList
          .map((e) => Expanded(
                child: Center(
                  widthFactor: 1,
                  child: Card(
                    elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10
                        ),
                        child: Image(
                          image: NetworkImage(e),
                          fit: BoxFit.scaleDown,
                        ),
                      )),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        height: 100,
        autoPlayInterval: const Duration( seconds:2 ) ,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          // enlargeCenterPage: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          autoPlay: true,
          scrollPhysics: const BouncingScrollPhysics()
      ),
    );
  }
}

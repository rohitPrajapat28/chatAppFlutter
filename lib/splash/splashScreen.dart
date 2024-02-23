import 'package:flutter/material.dart';
import '../widget/crousel.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(20),
      child: Carousel(),

    );
  }
}

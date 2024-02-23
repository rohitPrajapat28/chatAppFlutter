import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/UiHelper.dart';

class CustomSnack extends StatelessWidget {
     final String img;
    final String title;
    final String subtitle;

  const CustomSnack({Key?key, required this.img, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 75,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(18),
            border:
            Border.all(color: Colors.amber.shade500, width: 0.5),
          ),
          child:  Row(
            children: [
              const SizedBox(
                width: 80,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text(title,TextAlign.center,FontWeight.w600,50,Colors.white),
                    const SizedBox(
                      width: 40,
                    ),
                    text(subtitle,TextAlign.center,FontWeight.w300,20,Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
         Positioned(
            top: -4,
            child: ClipRRect(
              child: Stack(
                children: [
                  Image(
                    height: 90,
                    width: 80,
                    image: NetworkImage(
                        img),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ))
      ]
    );
  }

}



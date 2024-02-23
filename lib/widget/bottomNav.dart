

import 'package:flutter/material.dart';
class bottomNavigationBar extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape:  const CircularNotchedRectangle(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: Colors.amber.shade400,
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),
          const SizedBox(
            width: 1,
          ),
          IconButton(
            icon: const Icon(
              Icons.print,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),

          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),

        ],
      ),
    );
  }
}

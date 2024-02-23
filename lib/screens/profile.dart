import 'package:dartuif/screens/weepee2.dart';
import 'package:dartuif/screens/wepee.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _Profile createState()=> _Profile();

}

class _Profile extends State<Profile> {
  int _valueFromSecondChild = 0;
  // Callback function to be passed to the second child widget
  void _updateValueFromSecondChild(int value) {
    setState(() {
      _valueFromSecondChild = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // First Child Widget
          FirstChildWidget(callback: _updateValueFromSecondChild),
          // Display the value from the second child
          Text('Value from Second Child: $_valueFromSecondChild'),
          // Second Child Widget
          SecondChildWidget(),
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstChildWidget extends StatefulWidget {
  final ValueChanged<int> callback;

  FirstChildWidget({required this.callback});

  @override
  _FirstChildWidgetState createState() => _FirstChildWidgetState();
}

class _FirstChildWidgetState extends State<FirstChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          // Pass an integer value (e.g., 42) to the callback function
          widget.callback(42);
        },
        child: Text('Pass Integer to First Child'),
      ),
    );
  }
}


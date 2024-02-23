import 'package:flutter/cupertino.dart';

class SecondChildWidget extends StatefulWidget {
  @override
  _SecondChildWidgetState createState() => _SecondChildWidgetState();
}

class _SecondChildWidgetState extends State<SecondChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Second Child Widget'),
    );
  }
}
import 'package:dartuif/chat/screens/ChatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/UiHelper.dart';

class Messaging extends StatefulWidget {

  _Messaging createState() => _Messaging();

}

class _Messaging extends State<Messaging> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: text('text', TextAlign.center, FontWeight.w500, 20, Colors.amber),
    );

  }

}
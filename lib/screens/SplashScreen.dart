import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Container(
      color: Colors.amber.shade300,
      child: Center(
         child: Column(
           children: [
             Text(
               'Rom Rom Bhaiyo',
               style:  GoogleFonts.aldrich(
                 fontSize: 45,fontWeight: FontWeight.w400,color: CupertinoColors.white
               ),
             ),
           ],
         ),
      ),
    )
    );
  }

}
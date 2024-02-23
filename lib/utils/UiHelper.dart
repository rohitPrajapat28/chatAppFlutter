import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomBtn extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  CustomBtn(
      {super.key,
      required this.text,
      required this.height,
      required this.width});

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff253859), borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
            child: Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class NetSuiteBtn extends StatelessWidget {
  const NetSuiteBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffFFA634)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          child: Text(
            "Login with NetSuite",
            style: GoogleFonts.mulish(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff253859)),
          ),
        ),
      ),
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;

  const HorizontalSpace({
    Key? key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double height;

  const VerticalSpace({
    Key? key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

OutlineInputBorder inputBorder(
    double radius,
    double borderWidth,
    Color borderColor) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
          width: borderWidth,
          color: borderColor)
  );
}
Text text(
    String text,
    TextAlign alignment,
    FontWeight fontWeight,
    double size,
    Color color,){
  return Text(text,
    textAlign: alignment,
    style: GoogleFonts.mulish(
      fontWeight: fontWeight,
      color: color,
  ),
  );
}

BottomAppBar bottomNavigationBar(){
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
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.print,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.print,
            color: Colors.black,
          ),
          onPressed: () {},
        ),

      ],
    ),
  );
}


IconButton iconBtn(Icon icon, Color color,VoidCallback callback ){
  return IconButton(
    icon:  Icon(
     icon as IconData?,
      color: color,
    ),
    onPressed: () {
      callback;
    },
  );

}

class CustomButtonWithBorder extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  CustomButtonWithBorder({
    required this.height,
    required this.borderRadius,
    required this.borderColor,
    required this.borderWidth,
    required this.backgroundColor,
    required this.text,
    required this.textColor, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(

        decoration: BoxDecoration(
          color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(width: borderWidth, color: borderColor)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 18,
              ),// Text color
            ),
          ),
        ),
      ),
    );
  }
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16);
}
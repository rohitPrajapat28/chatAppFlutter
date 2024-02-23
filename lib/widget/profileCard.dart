import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
   final double height;
   final double width;

   final String name;
   final String title;
   final String address;
   final String gender;
   final String country;
   final String email;
   final String phone;

  const ProfileCard({
    Key?key,
    required this.height,
    required this.width,
    required this.name,
    required this.title,
    required this.address,
    required this.gender,
    required this.country,
    required this.email,
    required this.phone
  });

  @override
  Widget build(BuildContext context) {
    final _screen =  MediaQuery.of(context).size;
    return
     //  Expanded(
     // flex: 1,
     //  child:
      Card(
          color: Colors.transparent,
          elevation: 5,
          shadowColor: Colors.amber.shade300,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.amber.shade200, width: 1)),
          child: Expanded(

            child: Container(
              padding: const EdgeInsets.all(2),
              height: height,
              // width: _screen.width * width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      // center:  const Alignment(0.6,0.3),
                      begin: const Alignment(1.4, 0.2),
                      end: const Alignment(0.8, 0.9),
                      colors: [Colors.amber.shade100, Colors.amber.shade200])),
              child:   const Column(
                children: [
                  Text('data'),
                ],
              ),
            ),
          )
      // ),
    );
  }
}

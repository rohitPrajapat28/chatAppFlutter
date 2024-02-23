
import 'package:dartuif/screens/tags.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen/SuperCal.dart';

int type=0;
class Leads extends StatefulWidget{

  @override
  _Leads createState() => _Leads();

}
class _Leads extends State<Leads>{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return  CircleAvatar(
      radius: 30,
      backgroundColor: Colors.amber.shade200,
      child: Builder(builder: (context) {
        return Center(
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    height:  MediaQuery.of(context).size.height* 0.80,
                      child: ClaBottomSheet(),
                      );
                },
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 25,
              )),
        );
      }),
    );
  }
}
class ClaBottomSheet extends StatefulWidget {
  @override
  _ClaBottomSheet createState() => _ClaBottomSheet();
}

class _ClaBottomSheet extends State<ClaBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child:  Text(
                    'Select Date',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2D3436),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 25.0),
              child: CalendarTags(),
            ),
            const SizedBox(height: 16.0),
             Container(height: 0.5,color:Color(0xff8395A7).withOpacity(0.8)),
            const SizedBox(height: 16.0),
            SuperCalendar(selectionType: type),
          ],
        ),
      ),
    );
  }
}

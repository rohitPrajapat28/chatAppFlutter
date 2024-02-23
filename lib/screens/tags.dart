import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class CalendarTags extends StatefulWidget {
  final List<String> content = [
    ' New ',
    ' Last 7 days ',
    ' Last month ',
    ' This month ',
    ' This week ',
    ' Custom range',
  ];

  CalendarTags({
    super.key,
  });

  @override
  _CalendarTags createState() => _CalendarTags();
}

class _CalendarTags extends State<CalendarTags> {
  late AppData appData;
  int selectedTagIndex = -1;

  @override
  void initState() {
    super.initState();
   appData = AppData();
  }

  // Future<void> _loadSelectedTag() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedTagIndex = _prefs.getInt('selectedTagIndex') ?? -1;
  //     Provider.of<SharedData>(context, listen: false)
  //         .updateSelectionType(selectedTagIndex);
  //   });
  // }
  //
  // Future<void> _saveSelectedTag(int index) async {
  //   await _prefs.setInt('selectedTagIndex', index);
  // }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        widget.content.length,
            (index) => TagWidget(
          text: widget.content[index],
          onTap: ()  {
            appData.saveSelectedTag(index);
            // await _saveSelectedTag(index);
            Provider.of<SharedData>(context, listen: false)
                .updateSelectionType(index);
            print('Tapped ${widget.content[index]} $index');
            setState(() {
              selectedTagIndex = index;
            });
          },
          isSelected: index == appData.selectedTagIndex,
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  TagWidget({
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff152E58) : Color(0xffE6EAF5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(139, 139, 142, 0.16),
          //     spreadRadius: 1,
          //     blurRadius: 1,
          //     offset: Offset(1.75, 3.5),
          //   ),
          // ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xff2D3436),
          ),
        ),
      ),
    );
  }
}

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/UiHelper.dart';
class Data extends StatefulWidget {
  final List<String> fruits;
  final List<String> veges;
  const Data({super.key, required this.fruits, required this.veges});


  @override
  _Data createState() => _Data();
}

class _Data extends State<Data> {
  final TextEditingController _controller = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    // _loadData();
  }

  // Future<void> _loadData() async {
  //   // final response = await http.get(Uri.parse('https://api.example.com/data'));
  //   //
  //   // if (response.statusCode == 200) {
  //   //   print('api called fruits');
  //   //   final Map<String, dynamic> data = json.decode(response.body);
  //   //
  //   //   List<String> fruits = List<String>.from(data['fruits']);
  //   //   List<String> vegetables = List<String>.from(data['vegetables']);
  //   //   if (kDebugMode) {
  //   //     print(vegetables);
  //   //     print(fruits);
  //   //   }
  //     setState(() {
  //       _suggestions = [...fruits, ...vegetables];
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _suggestions = [...widget.fruits,...widget.veges];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            AutoCompleteTextField<String>(
              key: key,
              clearOnSubmit: false,
              suggestions: _suggestions,
              controller: _controller,
              style:  GoogleFonts.inter(
                color: const Color(0xff8395A7),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.amber.shade300,
                hintText: 'Search Leads',
                hintStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
                prefixIcon: const Icon(
                    Icons.search,
                color:Colors.white
                ),
                contentPadding: const EdgeInsets.all(15),
                  enabledBorder: inputBorder(30, 1, Colors.amber.shade100),
                  disabledBorder: inputBorder(30, 1, Colors.amber.shade100),
                  border:  inputBorder(30, 1,  Colors.amber.shade100),
                  errorBorder: inputBorder(30, 1,  Colors.amber.shade100),
                  focusedBorder: inputBorder(30, 1,   Colors.amber.shade100)

              ),
              itemFilter: (item, query) {
                return item.toLowerCase().startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.compareTo(b);
              },
              itemSubmitted: (item) {
                setState(() {
                  _controller.text = item;
                });
              },
              itemBuilder: (context, item) {
                return Container(
                  decoration:  BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: const BorderRadius.all(Radius.circular(0))
                  ),
                  child: ListTile(
                    title: Text(item,
                    style: GoogleFonts.inter(
                        color:  Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
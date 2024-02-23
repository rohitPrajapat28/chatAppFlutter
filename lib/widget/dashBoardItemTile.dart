import 'dart:io';

import 'package:dartuif/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/widgets.dart' as pw;

import 'CustoDialog.dart';
import 'customSnackbar.dart';


class DashBoardItemTile extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String email;
  final String gender;
  final String image;
  final int index;
 final Function(int) targetIndex;

  DashBoardItemTile(
      {Key? key,
      required this.name,
      required this.email,
      required this.gender,
      required this.image,
      required this.index, required this.targetIndex, });

  final home = HomeScreenState();

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(

            side: BorderSide(color: Colors.amber.shade400, width: 0.7),
            borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.amber.shade500, Colors.amber.shade200],
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
          ),
          child: ListTile(
            onTap: () {
              targetIndex(4);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // tileColor:Colors.amber.shade400,
            hoverColor: Colors.amber.shade50,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.network(image),
            ),
            title: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                      child: Text(name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,)
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    email,
                    overflow: TextOverflow.fade,
                      style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,)
                  ),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Row(children: [
                Text(
                  '( $gender )',
                  overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mulish(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,)
                ),
              ]),
            ]),
            trailing: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white38, borderRadius: BorderRadius.circular(23)),
              child: IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: (BuildContext context){
                       return CustomDialog(
                        list1: ['20% Off', '25% Off', '30% Off'],
                        list2: ['5 SR Off', '10 SR Off', '15 SR Off'],
                      );
                    }
                    );
                    pdf();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        content: CustomSnack(
                          title: 'Alert !',
                          img:
                              'https://freesvg.org/img/1691992632WingedSphinx2b.png',
                          subtitle:
                              'This is an example error message that will be shown in the body of snackbar!',
                        )));
                  },
                  color: Colors.white,
                  icon: const Icon(
                    Icons.delete,
                  )),
            ),
          ),
        ));
  }

  // void _showSnackBar(BuildContext context, String text) {
  void pdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );
    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

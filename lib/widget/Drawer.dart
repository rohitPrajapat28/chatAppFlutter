import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home.dart';

// class drawer extends StatelessWidget {
//   const drawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         child: ListTileTheme(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(
//                     top: 20.0,
//                     bottom: 10.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Material(
//                           elevation: 9,
//                           shape: const CircleBorder(),
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: Builder(builder: (context) {
//                                 return Image.network(
//                                   height: 90,
//                                   width: 90,
//                                   fit: BoxFit.cover,
//                                   'https://i.stack.imgur.com/TnoKV.png',
//                                 );
//                               })),
//                         ),
//                       ),
//                       Container(
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Jhon Doe",
//                                 style: GoogleFonts.mulish(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.black),
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 "Sales Man",
//                                 style: GoogleFonts.mulish(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 listTile(
//                     Icons.list_alt, "Deals", () {}, Colors.black, ),
//                 listTile(Icons.account_balance_wallet_outlined, "Leads", () {
//
//
//                 },
//                     Colors.black, ),
//                 listTile(Icons.add_business, "Orders", () {}, Colors.black,
//                     ),
//                 listTile(Icons.repeat_on_rounded, "Reports", () {},
//                     Colors.black, ),
//                 listTile(Icons.notification_important_outlined, "Notification",
//                     () {}, Colors.black, ),
//                 listTile(Icons.add_business, "Orders", () {}, Colors.black,
//                     ),
//                 listTile(Icons.data_thresholding_sharp, "Terms and Conditions",
//                     () {}, Colors.black, ),
//                 listTile(Icons.adb_outlined, "Privacy Policy", () {},
//                     Colors.black,),
//                 listTile(Icons.add_business, "Logout", () {}, Colors.pink,
//                     ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

ListTile listTile(IconData icon, String text, VoidCallback onPressed,
    Color color,) {
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: GoogleFonts.mulish(
          fontWeight: FontWeight.w400, fontSize: 20, color: color),
    ),
    onTap: onPressed,
  );
}

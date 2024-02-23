import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomSearchBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
   return  Card(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
         elevation: 0,
         child: Container(
           padding: const EdgeInsets.symmetric(horizontal: 15),
           decoration: BoxDecoration(
               color: Colors.amber.shade50,
               borderRadius: BorderRadius.circular(8),
           border:Border.all(width: 0.5,color: Colors.amber.shade400,)),
           child: const TextField(
             style: TextStyle(fontSize: 20, color: Colors.black45),
             decoration: InputDecoration(
               contentPadding: EdgeInsets.all(10),
               prefixIcon: Icon(
                 Icons.search,
                 color: Colors.orange,
                 size: 20,
               ),
               prefixIconConstraints:
               BoxConstraints(maxHeight: 20, minWidth: 25),
               border: InputBorder.none,
               hintText: 'Search',
               hintStyle: TextStyle(color: Colors.black38, fontSize: 20),
             ),
           ),
         ));
   }
  }
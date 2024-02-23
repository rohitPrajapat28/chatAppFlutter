import 'package:dartuif/widget/searchBar.dart';
import 'package:flutter/material.dart';

import '../screens/homeScreen/data.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  bool visiblity;



  TopBar({
    Key? key,
    required this.title,
    required this.visiblity,
  });

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}

class _TopBarState extends State<TopBar> {

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return
      SliverAppBar(

      automaticallyImplyLeading: false,
      backgroundColor: Colors.amber.shade500,
      elevation: 0,
      pinned: true,
      stretch: true,
      // scrolledUnderElevation: 0.5,
      expandedHeight: 115,
      // forceElevated: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 55,
              ),
              // Visibility(
              //     visible: widget.visiblity, child: const Data()),
            ],
          ),
        ),
      ),

      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // IconButton(
                //   color: Colors.white,
                //   icon: const Icon(
                //     Icons.arrow_back,
                //     size: 28,
                //   ),
                //   onPressed: () {
                //     SystemNavigator.pop();
                //     // Navigator.pushNamed(context, '');
                //   },
                // ),
                Center(
                  child: Text(widget.title,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

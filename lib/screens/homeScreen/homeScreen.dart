import 'dart:convert';

import 'package:dartuif/widget/dashBoardItemTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widget/crousel.dart';


class HomeScreen extends StatefulWidget {
  Function(int) onChangeIndex;
   HomeScreen({super.key, required this.onChangeIndex});

  @override
  _HomeScreen createState() => _HomeScreen();
}

List<dynamic> users = [];
List resultsList = [];
final PageController homeController = PageController(initialPage: 0);

class _HomeScreen extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // TopBar(title: 'DashBoard',visiblity: true)
        ],
        body: Container(
          // margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 1),
                child: Column(
                  children: [
                    Carousel(),
                    Theme(
                        data: ThemeData(splashColor: Colors.amber[100]),
                        child: Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: users.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final user = users[index];
                                  final image = user['picture']['thumbnail'];
                                  final name = user['name']['first'] +
                                      " " +
                                      user['name']['last'];
                                  final email = user['email'];
                                  final gender = user['gender'];
                                  return InkWell(
                                    child: DashBoardItemTile(
                                      index: index,
                                      name: name,
                                      email: email,
                                      gender: gender,
                                      image: image, targetIndex: widget.onChangeIndex, ),
                                  );
                                })))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void fetchUsers() async {
    print('api called');
    const url = 'http://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });

    print(users);
  }

}



import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = <String>['weee  pee', 'weee  pee', 'weee  pee', 'weee  pee', 'weee pee', 'weee  pee'];
    List<String>.generate(10000, (i) => 'Item $i');
    const title = 'message List';
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
            onTap: () {
              Navigator.push(context,'login' as Route<Object?>);
            },
          ),
          itemBuilder: (context, index) {
            return ListTile(

              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}

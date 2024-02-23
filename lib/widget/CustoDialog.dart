import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatefulWidget {
  final List<String> list1;
  final List<String> list2;

  CustomDialog({required this.list1, required this.list2});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> with TickerProviderStateMixin {
  late TabController _tabController;

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff0062FF).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(20.0),
                // bottomRight: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity Discount',
                  style: GoogleFonts.inter(
                    color: Color(0xff2D3436),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  iconSize: 25,
                  color: Color(0xff2D3436),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xffE9ECF3),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: TabBar(
                labelPadding: EdgeInsets.all(5),
                physics: BouncingScrollPhysics(),
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                labelColor: Colors.white, // Text color of the selected tab
                unselectedLabelColor: Colors.blue, // Text color of unselected tabs
                tabs: [
                  _buildTab('Precentages', 0),
                  _buildTab('Amount', 1),
                ],
              ),
            ),
          ),
          SizedBox(// Adjust the height as needed
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal:25,vertical: 10.0),
              child: Container(
                height: 140,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildList(widget.list1),
                    _buildList(widget.list2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: _selectedTabIndex == index
              ? Color(0xff152E58).withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                color: _selectedTabIndex == index
                    ? Color(0xff2D3436)
                    : Color(0xff152E58),
              )
              // TextStyle(
              //   color: _selectedTabIndex == index ? Color(0xff2D3436) : Color(0xff152E58),
              // ),
              ),
        ),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.ac_unit_outlined,
                      size: 24, color: Color(0xff8395A7)
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    items[index],
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2D3436),
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0,left: 5.0,top: 15.0),
                child: Container(
                  height: 1,
                  color: Color(0xffE6EAF5),
                ),
              )

            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

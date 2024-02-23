import 'package:dartuif/screens/homeScreen/homeScreen.dart';
import 'package:dartuif/screens/profile.dart';
import 'package:dartuif/screens/weepee2.dart';
import 'package:dartuif/widget/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chat/screens/Messagings.dart';
import '../utils/UiHelper.dart';
import '../widget/CoustomNotchRectangle.dart';
import '../widget/TnC.dart';
import 'Leads.dart';
import 'Search.dart';
import 'dashBoard.dart';
import 'homeScreen/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeScreenState();
}

final _advancedDrawerController = AdvancedDrawerController();
bool _bottomBarVisible = true, _drawerVisible = true;
int selectedIndex = 0;

bool get wantKeepAlive => true;
const bool useDense = false;
late PageController pageController;
List<String> fruits = ['Ap44ple', 'Ba12ana', 'Che89rry', 'Dat55e', 'Gra76pes'];
List<String> veges = ['App6le', 'Ba2nana', 'Che4rry', 'D6ate', 'Gr9apes'];
List<String> title = ['Home', 'Leads', 'Orders', 'Reports', 'Messaging', 'Notification', 'Some', 'More', 'Stuff'];
String headerTitle = 'Home';

class HomeScreenState extends State<Home> with WidgetsBindingObserver {
  Size get preferredSize => throw UnimplementedError();

  @override
  void initState() {
    _drawerVisible = true;
    _bottomBarVisible = true;
    pageController = PageController();
    super.initState();
  }

  Future<void> onTabTapped(int index) async {
    setState(() {
      FocusScope.of(context).unfocus();
      selectedIndex = index;
      switch (index) {
        case 0:
          headerTitle = title[0];
          _bottomBarVisible = true;
          _drawerVisible = true;
          break;
        case 1:
          headerTitle = title[1];
          _bottomBarVisible = true;
          _drawerVisible = false;
          break;
        case 2:
          headerTitle = title[2];
          _bottomBarVisible = true;
          _drawerVisible = false;
          break;
        case 3:
          headerTitle = title[3];
          _bottomBarVisible = false;
          _drawerVisible = false;
          break;
        case 4:
          headerTitle = title[4];
          _bottomBarVisible = true;
          _drawerVisible = false;
          break;
        case 5:
          headerTitle = title[5];
          _bottomBarVisible = true;
          _drawerVisible = false;
          break;
        case 6:
          headerTitle = title[6];
          _bottomBarVisible = false;
          _drawerVisible = false;
          break;
        case 7:
          headerTitle = title[7];
          _bottomBarVisible = false;
          _drawerVisible = false;
          break;
      }
      pageController.jumpToPage(index);
      _advancedDrawerController.hideDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.amber, Colors.amber.shade300.withOpacity(0.2)],
          ),
        ),
        child: SafeArea(
          child: Stack(children: [
            Positioned(
              top: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                child: const Icon(Icons.clear_rounded,
                    color: Colors.black87, size: 30),
              ),
            ),
          ]),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.bounceInOut,
      animationDuration: const Duration(milliseconds: 200),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 0.7,
      openRatio: 0.6,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListTileTheme(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Material(
                                elevation: 9,
                                shape: const CircleBorder(),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Builder(builder: (context) {
                                      return Image.network(
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.cover,
                                        'https://i.stack.imgur.com/TnoKV.png',
                                      );
                                    })),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jhon Doe",
                                    style: GoogleFonts.mulish(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Sales Man",
                                    style: GoogleFonts.mulish(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  listTile(
                    Icons.list_alt,
                    'Home',
                    () {
                      onTabTapped(0);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.account_balance_wallet_outlined,
                    'Leads' ,
                    () {
                      onTabTapped(1) ;
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.add_business,
                   'Reports' ,
                    () {
                      onTabTapped(2);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.repeat_on_rounded,
                    'Notifications' ,
                    () {
                      onTabTapped(3);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.notification_important_outlined,
                   'Messages',
                    () {
                      onTabTapped(5);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.add_business,
                   'Sales',
                    () {
                      onTabTapped(4);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.data_thresholding_sharp,
                    'Profile',
                    () {
                      onTabTapped(6);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.adb_outlined,
                    'Locations',
                    () {
                      onTabTapped(7);
                    },
                    Colors.black,
                  ),
                  listTile(
                    Icons.add_business,
                        'Logout',
                    () {
                      _bottomBarVisible = true;
                      _advancedDrawerController.hideDrawer();
                    },
                    Colors.pink,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber.shade500,
            title: text(headerTitle, TextAlign.start, FontWeight.w500, 26,
                Colors.white),
            leading: IconButton(
              onPressed: _drawerVisible
                  ? _handleMenuButtonPressed
                  : () {
                      onTabTapped(0);
                    },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      color: Colors.white,
                      _drawerVisible ? Icons.menu : Icons.arrow_back,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: _bottomBarVisible
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 18, right: 2, left: 2),
                  child: FloatingActionButton(
                    backgroundColor: Colors.amber.shade300,
                    shape: const CircleBorder(side: BorderSide.none),
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                )
              : null,
          bottomNavigationBar: _bottomBarVisible
              ? BottomAppBar(
                  color: Colors.amber.shade500,
                  notchMargin: 1,
                  shape: const CustomNotchedRectangle(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.home_filled,
                                color: selectedIndex == 0
                                    ? Colors.white
                                    : Colors.black),
                            onPressed: () {
                              onTabTapped(0);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search_rounded,
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : Colors.black),
                            onPressed: () {
                              onTabTapped(1);
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Icon(Icons.account_balance,
                                color: selectedIndex == 2
                                    ? Colors.white
                                    : Colors.black),
                            onPressed: () {
                              onTabTapped(2);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.account_circle_rounded,
                                color: selectedIndex == 3
                                    ? Colors.white
                                    : Colors.black),
                            onPressed: () {
                              onTabTapped(3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : null,
          body: PageView(
            allowImplicitScrolling: false,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              Center(
                child: HomeScreen(onChangeIndex: (index) => onTabTapped(index)),
              ),
              Center(
                child: Search(),
              ),
              const Center(
                child: DashBoard(),
              ),
              Center(
                child: Profile(),
              ),
              Center(
                child: Leads(),
              ),
              Center(
                child: Messaging(),
              ),
              Center(
                child: TnC(),
              ),
              Center(
                child: Data(fruits: fruits, veges: veges),
              ),
              Center(
                child: FirstChildWidget(
                  callback: (int value) {},
                ),
              ),
              Center(
                child: Data(fruits: fruits, veges: veges),
              ),
            ],
          ),
          extendBody: true,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  bool onWillPop() {
    final int currentPage = pageController.page?.round() ?? 0;
    if (currentPage == 1) {
      onTabTapped(0);
      return false;
    }
    if (pageController.page?.round() == pageController.initialPage) {
      return true;
    } else {
      onTabTapped(0);
      return false;
    }
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

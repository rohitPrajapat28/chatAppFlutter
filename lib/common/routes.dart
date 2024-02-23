
import 'package:dartuif/screens/Search.dart';
import 'package:dartuif/screens/SplashScreen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/Leads.dart';
import '../screens/dashBoard.dart';
import '../screens/homeScreen/homeScreen.dart';
import '../screens/home.dart';

import '../screens/loginPage.dart';
import '../screens/profile.dart';
import '../screens/registerPage.dart';

Widget InitialFunction(){
  return const LoginPage();
}

final Map<String, Widget Function(BuildContext)> namedRoutes = {
    // '/': (context) =>  InitialFunction(),
    'login': (context) => const LoginPage(),
    'splash': (context) => const SplashScreen(),
    'register': (context) => const RegisterPage(),
    'dash': (context) => const DashBoard(),
    'dashboard': (context) =>  HomeScreen(onChangeIndex: (int ) {  },),
    'home': (context) => Home(),
    'profile': (context) =>  Profile(),
    'search': (context) =>  Search(),
    'leads': (context) =>  Leads(),

};
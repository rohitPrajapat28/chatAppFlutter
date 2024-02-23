import 'package:dartuif/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'common/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.amber.shade500));
  runApp(
      ChangeNotifierProvider(create: (_) => SharedData(),
      child:MyApp()
      )
  );
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}

class SharedData extends ChangeNotifier {
  int _selectionType = 0;
  int get selectionType => _selectionType;

  void updateSelectionType(int value) {
    _selectionType = value;
    notifyListeners();
  }

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: namedRoutes,
      navigatorKey: navigatorKey,
      onGenerateRoute: (RouteSettings settings){
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage(),
        );
      },
    );
  }
}

class AppData {
  static final AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();
  int selectedTagIndex = -1,previousSelectionType=0;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool hasMovedToPreviousMonth = false;
  bool hasMovedToNextMonth = false;


  void saveSelectedRange(DateTime start, DateTime end) {
    startDate = start;
    endDate = end;
  }
  void saveSelectedTag(int tagIndex,) {
    selectedTagIndex = tagIndex;
  }
  void selectedPre(bool selected){
    hasMovedToPreviousMonth = selected;
  }
  void previousSelection(int preSelected){
    previousSelectionType = preSelected;
  }
  void selectednex(bool selected){
    hasMovedToNextMonth = selected;
  }

}
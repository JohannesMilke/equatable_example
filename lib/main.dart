import 'package:equatable_example/page/equatable_page.dart';
import 'package:equatable_example/page/no_equality_page.dart';
import 'package:equatable_example/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/manual_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Equatable';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: MyApp.title,
        tabs: [
          Tab(
            icon: Icon(Icons.clear),
            text: 'No Equality',
          ),
          Tab(
            icon: Icon(Icons.done),
            text: 'Manual',
          ),
          Tab(
            icon: Icon(Icons.done),
            text: 'Equatable',
          ),
        ],
        children: [
          NoEqualityPage(),
          ManualEqualityPage(),
          EquatablePage(),
        ],
      );
}

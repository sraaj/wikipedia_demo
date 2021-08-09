import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/model/wikipedia_notifier.dart';
import 'package:wikipedia_demo_app/utils/network_utils/base_view.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/color_const.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/tab_view.dart';

import 'game_page.dart';
import 'list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WikiListNotifier>(
      onModelReady: (model) async {
        model.getWikiList(context);
      },
      instanceModel: WikiListNotifier(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: TabView(
              length: 2,
              backgroundColor: kWHITE,
              indicatorColor: kHEADER_COLOR,
              unSelectedLabelColor: kBUTTON_ASH_COLOR,
              indicators: [
                TabViewIndicator(
                  title: 'Game Page',
                ),
                TabViewIndicator(
                  title: 'List Page',
                ),
              ],
              pages: [
                GamePage(),
                ListPage()
              ]),
        ),
      ),
    );
  }
}

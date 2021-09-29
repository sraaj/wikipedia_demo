import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/model/wikipedia_notifier.dart';
import 'package:wikipedia_demo_app/screens/widget_test_demo.dart';
import 'package:wikipedia_demo_app/utils/network_utils/base_view.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/color_const.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/tab_view.dart';

import 'game_page.dart';
import 'list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki List Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Wiki List Demo Home Page'),
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
      instanceModel: WikiListNotifier(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: CustomTabView(
              length: 3,
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
                TabViewIndicator(
                  title: 'Widget Test',
                ),
              ],
              pages: [
                GamePage(),
                ListPage(),
                WidgetTests()
              ]),
        ),
      ),
    );
  }
}

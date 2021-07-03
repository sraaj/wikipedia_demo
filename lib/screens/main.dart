import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/model/wikipedia_notifier.dart';
import 'package:wikipedia_demo_app/utils/network_utils/base_view.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/no_data_found.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/search_bar.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/show_toast.dart';

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
          title: Text('Wikipedia List'),
        ),
        body: model.state == ViewState.Busy
            ? Container()
            : model.wikipediaListResponse.query.pages.length > 0
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: SearchWidget(
                          onClear: () {
                            model.searchController.clear();
                            model.onSearch("", context);
                          },
                          textEditingController: model.searchController,
                          borderColor: Colors.grey,
                          fillColour: Colors.white70,
                          padding: 1,
                          hintText: 'Search',
                          onChanged: (val) {
                            model.onSearch(val, context);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.pageList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ShowToast.showToast(context,
                                    'Clicked on ${model.pageList[index].title}');
                              },
                              child: Container(
                                child: ListTile(
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: model.pageList[index]
                                                    .thumbnail !=
                                                null
                                            ? Container(
                                                width: 40,
                                                height: 40,
                                                child: Image.network(model
                                                            .pageList[index]
                                                            .thumbnail !=
                                                        null
                                                    ? model.pageList[index]
                                                        .thumbnail.source
                                                    : ''),
                                              )
                                            : ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                child: Container(
                                                    color: Colors.red,
                                                    width: 35,
                                                    height: 35,
                                                    child: Icon(
                                                        Icons.account_circle,
                                                        color: Colors.white)))),
                                    title: Text(
                                      model.pageList[index].title,
                                      style: TextStyle(
                                          fontFamily: 'OoredooHeavy',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    subtitle: Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    model.pageList[index].terms
                                                        .description[0],
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'OoredooHeavy',
                                                        fontSize: 13,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Text('')),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : NoDataFoundWidget(
                    context: context,
                    message: 'No Data Found',
                  ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/model/wikipedia_notifier.dart';
import 'package:wikipedia_demo_app/utils/network_utils/base_view.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/no_data_found.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/search_bar.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/show_toast.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WikiListNotifier>(
        onModelReady: (model) async {
      model.getWikiList(context);
    },
    instanceModel: WikiListNotifier(),
    builder: (context, model, child) =>
    model.state == ViewState.Busy
    ? Container():
    model.wikipediaListResponse.query.pages.length > 0
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
                                    'Clicked on the${model.pageList[index].title}');
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    ListTile(
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Container(
                                                        color: Colors.red,
                                                        width: 35,
                                                        height: 35,
                                                        child: Icon(
                                                            Icons
                                                                .account_circle,
                                                            color: Colors
                                                                .white)))),
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
                                                        model
                                                            .pageList[index]
                                                            .terms
                                                            .description[0],
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'OoredooHeavy',
                                                            fontSize: 13,
                                                            color:
                                                                Colors.black)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Text('')),
                                    Divider()
                                  ],
                                ),
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
                  ));
  }
}

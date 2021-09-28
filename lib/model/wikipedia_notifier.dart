import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/model/wikipedia_list_response.dart'
    as listResponse;
import 'package:wikipedia_demo_app/utils/network_utils/api_service.dart';

enum ViewState { Idle, Busy }

class WikiListNotifier extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  listResponse.WikipediaListResponse wikipediaListResponse;
  List<listResponse.Page> pageList = [];
  List<listResponse.Page> filterPageList = [];
  TextEditingController searchController = new TextEditingController();

  getWikiList(BuildContext context) async {
    setState(ViewState.Busy);
    try {
      Dio dio = await getDio(context);

      Response response = await dio.get(
          'https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=Sachin+T&gpslimit=10');

      if (response.statusCode == 200) {
        wikipediaListResponse =
            new listResponse.WikipediaListResponse.fromMap(response.data);
        pageList = wikipediaListResponse.query.pages;
        filterPageList = wikipediaListResponse.query.pages;
        setState(ViewState.Idle);
      }
      setState(ViewState.Idle);
    } on DioError catch (error) {
      if (error != null) {
        debugPrint("error response ---> " + error.message);
      }
      setState(ViewState.Idle);
    }
  }

  void onSearch(String text, BuildContext context) async {
    if (text == '') {
      pageList = filterPageList;
      notifyListeners();
    } else {
      final filteredUsers = filterPageList
          .where((u) => (u.title.toLowerCase().contains(text.toLowerCase())))
          .toList();
      pageList = filteredUsers;
      notifyListeners();
    }
  }
}

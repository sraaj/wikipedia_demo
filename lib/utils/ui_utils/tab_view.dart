import 'package:flutter/material.dart';

import 'color_const.dart';
import 'cutom_tab_indicator.dart';

class TabView extends StatefulWidget {
  final List<Widget> indicators;
  final List<Widget> pages;
  final Color unSelectedLabelColor;
  final Color selectedLabelColor;
  final Color backgroundColor;
  final int length;
  final Color indicatorColor;
  final bool isExpanded;
  final Function getActiveIndex;
  final Function getTabController;
  final int tabIndexPosition;

  const TabView(
      {@required this.indicators,
      @required this.pages,
      this.unSelectedLabelColor = kBLACK,
      this.selectedLabelColor = kWHITE,
      this.backgroundColor = kWHITE,
      this.length,
      this.indicatorColor,
      this.isExpanded = false,
      this.getActiveIndex,
      this.getTabController,
      this.tabIndexPosition = 0});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: widget.length,
        vsync: this,
        initialIndex: widget.tabIndexPosition);
    tabController.addListener(_setActiveTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.getTabController != null) {
      widget.getTabController(tabController);
    }
    return Container(
      child: widget.isExpanded
          ? Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: widget.backgroundColor,
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator: CustomTabIndicator(
                        indicatorColor: widget.indicatorColor),
                    labelPadding: EdgeInsets.only(left: 0, right: 0),
                    unselectedLabelColor: widget.unSelectedLabelColor,
                    labelColor: widget.selectedLabelColor,
                    tabs: widget.indicators,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: widget.pages,
                  ),
                )
              ],
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: widget.backgroundColor,
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator: CustomTabIndicator(
                        indicatorColor: widget.indicatorColor),
                    labelPadding: EdgeInsets.only(left: 0, right: 0),
                    unselectedLabelColor: widget.unSelectedLabelColor,
                    labelColor: widget.selectedLabelColor,
                    tabs: widget.indicators,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: widget.pages,
                  ),
                )
              ],
            ),
    );
  }

  void _setActiveTabIndex() {
    if (widget.getActiveIndex != null) {
      widget.getActiveIndex(tabController.index);
    }
  }
}

class TabViewIndicator extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  const TabViewIndicator({this.title, this.width = 100.0, this.height = 30.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(right: 20, left: 20),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 11.5),
      ),
    );
  }
}

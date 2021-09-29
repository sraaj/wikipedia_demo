import 'package:flutter/material.dart';

Widget noDataFoundWidget({
  @required BuildContext context,
  String message = '',
  bool isPadding = true,
}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    padding: isPadding == false
        ? EdgeInsets.zero
        : EdgeInsets.only(top: 150, bottom: 10),
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/icon_info.png',
          height: 30,
          width: 30,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          message,
          style: TextStyle(fontSize: 14),
        )
      ],
    ),
  );
}

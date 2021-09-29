import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/button.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/color_const.dart';

class WidgetTests extends StatefulWidget {
  @override
  _WidgetTestsState createState() => _WidgetTestsState();
}

class _WidgetTestsState extends State<WidgetTests> {
  TextEditingController _controller;
  String _reversedText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter text"),
              ),
            ),
            const SizedBox(height: 10.0),
            if (_reversedText != null) ...[
              Text(
                _reversedText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
            CustomButton(
              colour: kBLACK,
              title: 'Reverse Text',
              onPressed: () {
                if (_controller.text.isEmpty) return;
                setState(() {
                  _reversedText = reverseText(_controller.text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String reverseText(String initial) {
  return initial.split('').reversed.join();
}

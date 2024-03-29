import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/button.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/color_const.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String direction;
  double marginTop;
  double increment;
  double start;
  double end;
  Duration duration;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    marginTop = 0;
    direction = 'down';
    increment = 25;
    start = 0;
    end = 100;
    duration = Duration(milliseconds: 250);

    _timer = new Timer.periodic(duration, bounce);
  }

  void setDirection() {
    if (marginTop == end) {
      if (mounted)
        setState(() {
          direction = 'up';
        });
    }

    if (marginTop == start) {
      if (mounted)
        setState(() {
          direction = 'down';
        });
    }
  }

  void bounce(Timer t) {
    setDirection();
    if (mounted)
      setState(() {
        if (direction == 'down') {
          marginTop += increment;
        } else {
          marginTop -= increment;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: EdgeInsets.only(top: marginTop),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kYELLOW_SHADE,
              ),
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

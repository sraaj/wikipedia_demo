import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'color_const.dart';

class CustomTabIndicator extends Decoration {
  final Color indicatorColor;

  CustomTabIndicator({this.indicatorColor = kLIGHTBLACK});
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged, indicatorColor);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final Color indicatorColor;
  _CustomPainter(
    this.decoration,
    VoidCallback onChanged,
    this.indicatorColor,
  )   : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect =
        Offset(offset.dx, (configuration.size.height / 2) - 30 / 2) &
            Size(configuration.size.width, 30);
    final Paint paint = Paint();
    paint.color = indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(20.0)), paint);
  }
}

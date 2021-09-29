import 'package:flutter/material.dart';

import 'color_const.dart';
import 'normal_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.title = 'Sample',
    this.colour = kPINK_BUTTON_COLOR,
    @required this.onPressed,
    this.width = 0.0,
    this.height = 47.0,
    this.margin = 0.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
    this.topMargin = 0.0,
    this.bottomMargin = 0.0,
    this.visibility = true,
    this.fontSize = 16,
    this.borderRadius = 30.0,
    this.padding = 0.0,
    this.leftPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.rightPadding = 0.0,
    this.fontWeight = FontWeight.bold,
    this.fontFamily = 'Roboto-Medium',
    this.opacity = 0.8,
    this.elevation = 5.0,
    this.isTitleCaps = true,
    this.buttonAlignmentHorizontal = MainAxisAlignment.center,
    this.buttonAlignmentVertical = CrossAxisAlignment.center,
    this.fontColor = kWHITE,
    this.isOutlined = false,
    this.isDisabled = false,
  });

  final Color colour;
  final String title;
  final Function onPressed;
  final double height;
  final double width;
  final double margin;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final bool visibility;
  final double fontSize;
  final double borderRadius;
  final double padding;
  final double leftPadding;
  final double topPadding;
  final double bottomPadding;
  final double rightPadding;
  final FontWeight fontWeight;
  final String fontFamily;
  final double opacity;
  final double elevation;
  final bool isTitleCaps;
  final MainAxisAlignment buttonAlignmentHorizontal;
  final CrossAxisAlignment buttonAlignmentVertical;
  final Color fontColor;
  final bool isDisabled;

  /// If true, button is outlined otherwise it's filled.
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return visibility
        ? Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: buttonAlignmentHorizontal,
              crossAxisAlignment: buttonAlignmentVertical,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                width == 0.0
                    ? Expanded(
                        child: Container(
                          padding: padding == 0.0
                              ? EdgeInsets.only(
                                  left: leftPadding,
                                  top: topPadding,
                                  bottom: bottomPadding,
                                  right: rightPadding,
                                )
                              : EdgeInsets.all(padding),
                          margin: margin == 0.0
                              ? EdgeInsets.fromLTRB(
                                  leftMargin,
                                  topMargin,
                                  rightMargin,
                                  bottomMargin,
                                )
                              : EdgeInsets.all(margin),
                          child: Opacity(
                            opacity: opacity,
                            child: Material(
                              elevation: elevation,
                              color: !isOutlined
                                  ? !isDisabled
                                      ? colour
                                      : kASH_SHADE_EIGHT
                                  : kCARD_SHADOW,
                              borderRadius: BorderRadius.circular(borderRadius),
                              child: InkWell(
                                onTap: !isDisabled ? onPressed : null,
                                child: Container(
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: !isOutlined
                                        ? !isDisabled
                                            ? colour
                                            : kASH_SHADE_EIGHT
                                        : null,
                                    border: isOutlined
                                        ? Border.all(color: colour)
                                        : null,
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                  ),
                                  child: Center(
                                    child: NormalText(
                                      text: isTitleCaps
                                          ? title.toUpperCase()
                                          : title,
                                      fontcolor:
                                          !isOutlined ? fontColor : colour,
                                      fontFamily: fontFamily,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: padding == 0.0
                            ? EdgeInsets.only(
                                left: leftPadding,
                                top: topPadding,
                                bottom: bottomPadding,
                                right: rightPadding,
                              )
                            : EdgeInsets.all(padding),
                        margin: margin == 0.0
                            ? EdgeInsets.fromLTRB(
                                leftMargin,
                                topMargin,
                                rightMargin,
                                bottomMargin,
                              )
                            : EdgeInsets.all(margin),
                        child: Opacity(
                          opacity: opacity,
                          child: Material(
                            elevation: elevation,
                            color: !isOutlined
                                ? !isDisabled
                                    ? colour
                                    : kASH_SHADE_EIGHT
                                : kCARD_SHADOW,
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: InkWell(
                              onTap: onPressed,
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  color: !isOutlined
                                      ? !isDisabled
                                          ? colour
                                          : kASH_SHADE_EIGHT
                                      : null,
                                  border: isOutlined
                                      ? Border.all(color: colour)
                                      : null,
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                ),
                                child: Center(
                                  child: NormalText(
                                    text: isTitleCaps
                                        ? title.toUpperCase()
                                        : title,
                                    fontcolor: !isOutlined ? fontColor : colour,
                                    fontFamily: fontFamily,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        : Container();
  }
}

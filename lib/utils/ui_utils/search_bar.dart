import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final TextInputType inputType;
  final Color backgroundColor;
  final Color fillColor;
  final Color fontColor;
  final Color borderColor;
  final String hintText;
  final double padding;
  final double leftPadding;
  final double topPadding;
  final double bottomPadding;
  final double rightPadding;
  final Color fillColour;
  final Function onChanged;
  final Function onClear;
  final double width;
  final double searchHeight;
  final bool suffixRequired;
  final Function onSubmit;

  const CustomSearchWidget(
      {Key key,
      this.textEditingController,
      this.label,
      this.inputType,
      this.backgroundColor,
      this.fontColor,
      this.fillColor,
      this.borderColor = Colors.black,
      this.hintText = 'Search Gallery',
      this.padding = 0.0,
      this.leftPadding = 15.0,
      this.topPadding = 10.0,
      this.bottomPadding = 10.0,
      this.rightPadding = 15.0,
      this.fillColour = Colors.white,
      this.onChanged,
      this.onClear,
      this.width = double.infinity,
      this.onSubmit,
      this.searchHeight = 41,
      this.suffixRequired = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding == 0.0
          ? EdgeInsets.only(
              left: leftPadding,
              top: topPadding,
              bottom: bottomPadding,
              right: rightPadding)
          : EdgeInsets.all(padding),
      height: searchHeight,
      width: width,
      color: backgroundColor,
      child: Center(
        child: TextFormField(
          enableInteractiveSelection: false,
          onFieldSubmitted: (val) => onSubmit(val),
          onChanged: (val) => onChanged(val),
          keyboardType: inputType,
          controller: textEditingController,
//          maxLength: 10,
          style: TextStyle(
            color: fontColor,
            fontSize: 14,
            fontFamily: 'Roboto-Medium',
          ),
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.all(1),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto-Medium',
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            fillColor: fillColour,
            counterText: '',
            labelText: label,
            labelStyle:
                TextStyle(color: fontColor, fontFamily: 'Roboto-Regular'),
            suffixIcon: InkWell(
              onTap: onClear,
              /*() {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => textEditingController.clear());
              },*/
              child: Visibility(
                visible: textEditingController.text.length > 0 ? true : false,
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
            hasFloatingPlaceholder: true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

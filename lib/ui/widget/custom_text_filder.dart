import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final String labelText;
  final Color textColor;
  final Color borderColor;
  final double fontSize;

  CustomTextField({
    this.labelText,
    this.textColor,
    this.borderColor,
    this.fontSize
  }) : super(
          decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: textColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: borderColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: borderColor)),
        ),
    style: TextStyle(color: Colors.white, fontSize: fontSize)
  );
}

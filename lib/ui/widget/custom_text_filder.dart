import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final String labelText;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final int minLines;
  final int maxLines;

  CustomTextField({
    this.labelText,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.minLines,
    this.maxLines
  }) : super(
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: textColor),
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 2)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor)),
        ),
    style: TextStyle(color: Colors.white, fontSize: fontSize)
  );
}

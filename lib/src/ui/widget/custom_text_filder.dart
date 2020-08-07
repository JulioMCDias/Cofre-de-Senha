import 'package:flutter/material.dart';

class CustomTextField extends TextFormField {
  final String labelText;
  final String errorText;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;

  CustomTextField({
    this.labelText,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.minLines,
    this.maxLines,
    this.controller,
    this.errorText,
  }) : super(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            errorText: errorText,
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

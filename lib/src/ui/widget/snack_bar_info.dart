
import 'package:flutter/material.dart';

class SnackBarInfo extends SnackBar{
  SnackBarInfo(info, onPressed) : super(
    content: Text(info),
  );
}
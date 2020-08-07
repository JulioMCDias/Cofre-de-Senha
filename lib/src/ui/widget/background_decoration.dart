import 'package:flutter/material.dart';

class BackgroundDecoration extends BoxDecoration {

  BackgroundDecoration() : super (
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blueAccent,
        Colors.indigo
      ]
    )
  );
}



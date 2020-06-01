
import 'package:cofresenha/ui/screens/open_repository_screen.dart';
import 'package:cofresenha/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cofre de senhas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        unselectedWidgetColor: Colors.white,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}


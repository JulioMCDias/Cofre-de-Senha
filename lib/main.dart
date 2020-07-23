
import 'package:cofresenha/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends AppMVC {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        unselectedWidgetColor: Colors.white,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      title: "Cofre de senha",
    );
  }
}


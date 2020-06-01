import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:flutter/material.dart';

class ListBookScreen extends StatefulWidget {
  @override
  _ListBookScreenState createState() => _ListBookScreenState();
}

class _ListBookScreenState extends State<ListBookScreen> {
  final List<String> _passwords = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Cadernos",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
        ),
        body: Container(
            decoration: BackgroundDecoration(),
            height: double.infinity,
            child: Center(

            )
        )
    );
  }

}

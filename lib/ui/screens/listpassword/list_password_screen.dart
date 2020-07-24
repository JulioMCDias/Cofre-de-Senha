import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/ui/screens/addpassword/add_password_screen.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/card_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPasswordScreen extends StatefulWidget {
  @override
  _ListPasswordScreenState createState() => _ListPasswordScreenState();
}

class _ListPasswordScreenState extends State<ListPasswordScreen> {
  final List<Password> _notePasswords = List();
  final String _title = "Sites";

  @override
  void initState() {
    super.initState();
    _notePasswords.add(Password(name: "nome", title: "Titulo",
      email: "email@test.com", password: "password"));

    _notePasswords.add(Password(name: "nomess", title: "Titulo",
      email: "email@test.com", password: "passwoadssdrd"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(_title,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Center(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: _notePasswords.length,
            itemBuilder: (context, index){
              return CardPassword(_notePasswords[index]);
            },
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute( builder: (context) => AddPasswordScreen())
          );
        },
      ),
    );
  }
}

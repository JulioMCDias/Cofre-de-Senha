import 'package:cofresenha/data/model/note_password.dart';
import 'package:cofresenha/ui/screens/add_password_screen.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPasswordScreen extends StatefulWidget {
  @override
  _ListPasswordScreenState createState() => _ListPasswordScreenState();
}

class _ListPasswordScreenState extends State<ListPasswordScreen> {
  final List<NotePassword> _notePasswords = List();
  final String _title = "Sites";
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _notePasswords.add(NotePassword(name: "nome", title: "Titulo",
      email: "email@test.com", password: "password"));

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
              return _infoCard(context, _notePasswords[index]);
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

  Widget _infoCard (context, NotePassword notePassword){
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(notePassword.title, style: TextStyle(color: Colors.indigo, fontSize: 22),),
                  ),
                  Text(notePassword.email, style: TextStyle(color: Colors.indigo, fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(notePassword.name,
                            style: TextStyle(color: Colors.indigo, fontSize: 18,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Text(notePassword.password,
                              style: TextStyle(color: Colors.indigo, fontSize: 18),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: IconButton(
                            icon: Icon(
                              _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                              color: Colors.indigo,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

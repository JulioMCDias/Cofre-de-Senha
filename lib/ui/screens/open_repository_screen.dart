import 'package:cofresenha/ui/screens/list_book_screen.dart';
import 'package:cofresenha/ui/screens/list_password_screen.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/custom_text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenRepositoryScreen extends StatefulWidget {
  @override
  _OpenRepositoryScreenState createState() => _OpenRepositoryScreenState();
}

class _OpenRepositoryScreenState extends State<OpenRepositoryScreen> {
  String _nameRepository = "/repository";
  bool _rememberVal = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Repositorio:",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(_nameRepository,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                CustomTextFromField(
                  passwordVisible: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: _rememberVal,
                      checkColor: Colors.blue,
                      activeColor: Colors.white,

                      onChanged: (value) {
                        setState(() {
                          _rememberVal = value;
                        });
                      },
                    ),
                    Text("Relembar senha", style: TextStyle(color: Colors.white),)
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 25),
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListPasswordScreen())
                      );
                    },
                    elevation: 5,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.folder_open,
                                color: Colors.indigo,
                              ),
                              Center(
                                child: Text(
                                  "Abrir",
                                  style: TextStyle(fontSize: 20,
                                    color: Colors.indigo),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

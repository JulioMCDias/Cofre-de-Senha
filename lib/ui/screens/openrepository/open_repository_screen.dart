import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/ui/screens/listbook/list_book_screen.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/text_form_field_password.dart';
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
  TextEditingController _textEditingPassword = TextEditingController();


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
                Text(S.of(context).infoRepository,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(_nameRepository,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                TextFormFieldPassword(
                  color: Theme.of(context).primaryColor,
                  controller: _textEditingPassword,
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
                    Text(
                      S.of(context).checkBoxPassword,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 25),
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ListBookScreen())
                      );
                    },
                    elevation: 5,
                    padding: EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
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
                                  S.of(context).btnOpenRepository,
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

import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/ui/widget/text_form_field_password.dart';
import 'package:flutter/material.dart';


class CardPassword extends StatefulWidget {
  final Password notePassword;
  CardPassword(this.notePassword);

  @override
  _CardPasswordState createState() => _CardPasswordState(notePassword);
}

class _CardPasswordState extends State<CardPassword> {

  final Password _notePassword;
  final _textEditingPassword = TextEditingController();

  _CardPasswordState(this._notePassword);


  @override
  void initState() {
    super.initState();
    _textEditingPassword.text = _notePassword.password;
  }



  @override
  Widget build(BuildContext context) {
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
                    child: Text(_notePassword.title, style: TextStyle(color: Colors.indigo, fontSize: 22),),
                  ),
                  Text(_notePassword.email, style: TextStyle(color: Colors.indigo, fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(_notePassword.name,
                            style: TextStyle(color: Colors.indigo, fontSize: 18,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: TextFormFieldPassword(
                            color: Colors.indigo,
                            controller: _textEditingPassword,
                            editable: true,
                            textAlign: TextAlign.right,
                          )
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

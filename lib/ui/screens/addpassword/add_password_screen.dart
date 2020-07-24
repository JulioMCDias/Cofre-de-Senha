import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/custom_text_filder.dart';
import 'package:cofresenha/ui/widget/text_form_field_password.dart';
import 'package:flutter/material.dart';

class AddPasswordScreen extends StatefulWidget {
  final Password password;
  AddPasswordScreen({this.password});


  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {

  final _textEditingPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
          title: Text(S.of(context).titleNewPassword,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    labelText: S.of(context).fieldTitlePassword,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    labelText: S.of(context).fieldName,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    labelText: S.of(context).fieldEmail,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: TextFormFieldPassword(
                    color: Theme.of(context).primaryColor,
                    controller: _textEditingPassword
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    minLines: 8,
                    maxLines: 15,
                    labelText: S.of(context).fieldDescription,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

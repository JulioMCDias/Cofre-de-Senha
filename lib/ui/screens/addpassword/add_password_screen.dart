import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/ui/screens/addpassword/add_password_bloc.dart';
import 'package:cofresenha/ui/screens/addpassword/add_password_controller.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/custom_text_filder.dart';
import 'package:cofresenha/ui/widget/text_form_field_password.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



class AddPasswordScreen extends StatefulWidget {
  final Password password;
  AddPasswordScreen({this.password});


  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends StateMVC<AddPasswordScreen> {
  AddPasswordBloc _bloc;
  AddPasswordCon con;

  _AddPasswordScreenState(): super(AddPasswordCon());

  @override
  void initState() {
    _bloc = AddPasswordBloc(context);
    con = (controller as AddPasswordCon);
    con.bloc = _bloc;
    con.setPassword(widget?.password);
    super.initState();
  }

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
                  child: StreamBuilder(
                    stream: _bloc.streamValidateTitle,
                    initialData: null,
                    builder:(context, validate) => CustomTextField(
                      errorText: validate.data,
                      labelText: S.of(context).fieldTitlePassword,
                      controller: _bloc.textEditingTitle,
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    labelText: S.of(context).fieldName,
                    controller: _bloc.textEditingName,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: StreamBuilder(
                    stream: _bloc.streamValidateEmail,
                    initialData: null,
                    builder:(context, validate) => CustomTextField(
                      errorText: validate.data,
                      labelText: S.of(context).fieldEmail,
                      controller: _bloc.textEditingEmail,
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: StreamBuilder(
                    stream: _bloc.streamValidatePassword,
                    initialData: null,
                    builder:(context, validate) => TextFormFieldPassword(
                      errorText: validate.data,
                      color: Theme.of(context).primaryColor,
                      controller: _bloc.textEditingPassword
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    minLines: 8, maxLines: 15, fontSize: 20,
                    labelText: S.of(context).fieldDescription,
                    controller: _bloc.textEditingDescription,
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
          if(_bloc.isValidEmail() & _bloc.isValidTitle() & _bloc.isValidPassword())
            con.save();
        },
      ),
    );
  }


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

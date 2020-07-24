import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/data/repository.dart';
import 'package:cofresenha/ui/screens/addpassword/add_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class AddPasswordCon extends ControllerMVC{
  final _repository = Repository();
  AddPasswordBloc bloc;

  // Singleton Factory
  AddPasswordCon._();
  static final AddPasswordCon _this = AddPasswordCon._();

  factory AddPasswordCon() {
    return _this;
  }


  //------------------- AddPassword -------------------------
  Password _password;
  void setPassword(Password password){
    password = password;
    if(password != null){
      bloc.textEditingTitle.text = password.title;
      bloc.textEditingName.text = password.name;
      bloc.textEditingEmail.text = password.email;
      bloc.textEditingPassword.text = password.password;
      bloc.textEditingDescription.text = password.description;
    }
  }

  void save(){
    if(_password == null){
      _repository.addPassword(Password()
        ..title = bloc.textEditingTitle.text
        ..name = bloc.textEditingName.text
        ..email = bloc.textEditingEmail.text
        ..password = bloc.textEditingPassword.text
        ..description = bloc.textEditingDescription.text);
    
    }else {
      _password
        ..title = bloc.textEditingTitle.text
        ..name = bloc.textEditingName.text
        ..email = bloc.textEditingEmail.text
        ..password = bloc.textEditingPassword.text
        ..description = bloc.textEditingDescription.text;
    }
    _blackScreen();
  }


  void _blackScreen(){
    Navigator.of(context).pop();
  }

}
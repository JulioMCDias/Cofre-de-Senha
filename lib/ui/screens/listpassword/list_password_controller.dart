import 'package:cofresenha/data/model/password.dart';
import 'package:cofresenha/data/repository.dart';
import 'package:cofresenha/ui/screens/addpassword/add_password_screen.dart';
import 'package:cofresenha/ui/screens/listpassword/list_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ListPasswordCon extends ControllerMVC{

  final _repository = Repository();
  ListPasswordBloc bloc;

  // Singleton Factory
  ListPasswordCon._();
  static final ListPasswordCon _this = ListPasswordCon._();

  factory ListPasswordCon() {
    return _this;
  }


//------------------- ListPassword -------------------------
  void updateList(){
    bloc.setListPassword(_repository.getListPassword());
  }

  void addPassword(){
    Navigator.push(context,
      MaterialPageRoute( builder: (context) => AddPasswordScreen())
    );
  }

  void editPassword(Password password){
    Navigator.push(context,
      MaterialPageRoute( builder: (context) => AddPasswordScreen(password: password))
    );
  }
}
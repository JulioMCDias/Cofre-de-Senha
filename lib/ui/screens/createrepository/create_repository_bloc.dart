

import 'dart:async';

import 'package:cofresenha/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class CreateRepositoryBloc {

  final _blocPathRepository = StreamController<String>();
  Stream<String> get streamPathRepository => _blocPathRepository.stream;

  final _blocRememberPassword = StreamController<bool>();
  Stream<bool> get streamRememberPassword => _blocRememberPassword.stream;

  final _blocValidatePassword = StreamController<String>();
  Stream<String> get streamValidatePassword => _blocValidatePassword.stream;

  final _blocValidateName = StreamController<String>();
  Stream<String> get streamValidateName => _blocValidateName.stream;



  // validate password
  bool validatePassword(BuildContext context, String password){
    if(password == null || password == '') {
      _blocValidatePassword.sink.add(S.of(context).validatePassword);
      return false;
    }
    _blocValidatePassword.sink.add(null);
    return true;
  }

  // validate Name File
  bool validateNameFile(BuildContext context, String name){
    if(name == null || name == '') {
      _blocValidateName.sink.add(S.of(context).validateNameFile);
      return false;
    }
    _blocValidateName.sink.add(null);
    return true;
  }

  void setPathRepository(String name){
    _blocPathRepository.sink.add(name);
  }

  void setRememberPassword(bool remember){
    _blocRememberPassword.sink.add(remember);
  }




  void dispose(){
    _blocPathRepository.close();
    _blocRememberPassword.close();
    _blocValidatePassword.close();
    _blocValidateName.close();
  }
}
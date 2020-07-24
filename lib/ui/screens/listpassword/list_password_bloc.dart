
import 'dart:async';

import 'package:cofresenha/data/model/password.dart';

class ListPasswordBloc{

  final _listPassword = StreamController<List<Password>>();
  Stream<List<Password>> get streamListPassword => _listPassword.stream;

  void setListPassword(List<Password> passwords){
    _listPassword.sink.add(passwords);
  }


  final _title = StreamController<String>();
  Stream<String> get streamTitle => _title.stream;

  void setTitle(String title){
    _title.sink.add(title);
  }


  void dispose(){
    _listPassword.close();
    _title.close();
  }
}
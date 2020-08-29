

import 'dart:async';

import 'package:cofresenha/src/presentation/listbook/list_book_presenter.dart';
import 'package:cofresenha/src/utils/constants.dart' as Constants;
import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/presentation/createrepository/create_repository_presenter.dart';
import 'package:cofresenha/src/presentation/createrepository/create_repository_view.dart';
import 'package:cofresenha/src/ui/screens/createrepository/create_repository_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateRepositoryBloc implements CreateRepositoryView{
  @override CreateRepositoryScreen screen;
  final CreateRepositoryPresenter _presenter;
  BuildContext _context;

  final textEditingPassword = TextEditingController();


  //----- construtor --------
  CreateRepositoryBloc(this._presenter) {
    screen = CreateRepositoryScreen(this);

  }

  //----- initState -----
  void initState(BuildContext context){
    this._context = context;
    _presenter.init();
  }


  // ------------- StreamControllers -----------------
  final _blocPathRepository = StreamController<String>();
  Stream<String> get streamPathRepository => _blocPathRepository.stream;

  final _blocRememberPassword = StreamController<bool>();
  Stream<bool> get streamRememberPassword => _blocRememberPassword.stream;

  final _blocValidatePassword = StreamController<String>();
  Stream<String> get streamValidatePassword => _blocValidatePassword.stream;



  // --------------- OpenRepository ---------------
  void btnCreateRepository(){
    if(validatePassword(_context, textEditingPassword.text))
      _presenter.createRepository(textEditingPassword.text);
  }


  // validate password
  bool validatePassword(BuildContext context, String password){
    if(password == null || password == '') {
      _blocValidatePassword.sink.add(S.of(context).validatePassword);
      return false;
    }
    _blocValidatePassword.sink.add(null);
    return true;
  }


  @override
  void setPathRepository(String name){
    _blocPathRepository.sink.add(name);
  }

  @override
  void setRememberPassword(bool remember){
    _blocRememberPassword.sink.add(remember);
  }

  @override
  void navigationListBook(){
    Navigator.of(_context).pushReplacement(
      MaterialPageRoute(builder: (context) => ListBookPresenter().view.screen)
    );
  }



  void dispose(){
    _blocPathRepository.close();
    _blocRememberPassword.close();
    _blocValidatePassword.close();
  }
}
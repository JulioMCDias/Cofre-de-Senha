
import 'dart:async';

import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/presentation/listbook/list_book_presenter.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_presenter.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_view.dart';
import 'open_repository_screen.dart';
import 'package:flutter/material.dart';

class OpenRepositoryBloc implements OpenRepositoryView{
  @override OpenRepositoryScreen screen;
  final OpenRepositoryPresenter _presenter;
  BuildContext _context;

  final textEditingPassword = TextEditingController();


  //----- construtor --------
  OpenRepositoryBloc(this._presenter) {
    screen = OpenRepositoryScreen(this);
  }

  //----- initState -----
  void initState(BuildContext context){
    this._context = context;
    _presenter.init();
  }


  // ----- informar erro ao usario ------
  @override
  Function(String) infoError;


  // ------------- StreamControllers -----------------
  final _blocPathRepository = StreamController<String>();
  Stream<String> get streamPathRepository => _blocPathRepository.stream;

  final _blocRememberPassword = StreamController<bool>();
  Stream<bool> get streamRememberPassword => _blocRememberPassword.stream;

  final _blocValidatePassword = StreamController<String>();
  Stream<String> get streamValidatePassword => _blocValidatePassword.stream;

  final _blocLoadingVisibility = StreamController<bool>();
      Stream<bool> get streamLoadingVisibility => _blocLoadingVisibility.stream;



  // ----- carregamento visivel ------
  @override
  void loadingVisibility(bool enable){
    _blocLoadingVisibility.sink.add(enable);
  }



  void btnOpenRepository(){
    if(validatePassword(_context, textEditingPassword.text)) {
      _presenter.openRepository(textEditingPassword.text);
    }
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



  // ----- dispose -------
  void dispose(){
    _blocPathRepository.close();
    _blocRememberPassword.close();
    _blocValidatePassword.close();
    _blocLoadingVisibility.close();
  }
}

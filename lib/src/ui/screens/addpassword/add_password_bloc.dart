
import 'dart:async';

import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/presentation/addpassword/add_password_presenter.dart';
import 'package:cofresenha/src/presentation/addpassword/add_password_view.dart';
import 'package:cofresenha/src/ui/screens/addpassword/add_password_screen.dart';
import 'package:flutter/material.dart';

class AddPasswordBloc implements AddPasswordView{
  @override AddPasswordScreen screen;
  BuildContext _context;
  final AddPasswordPresenter _presenter;

  //----- construtor --------
  AddPasswordBloc(this._presenter) {
    screen = AddPasswordScreen(this);
  }

  //----- initState -----
  void initState(BuildContext context){
    this._context = context;
    _presenter.init();
  }



// ------------- StreamControllers -----------------
  final _textEditingTitle = TextEditingController();
    get textEditingTitle => _textEditingTitle;

  final _textEditingName = TextEditingController();
    get textEditingName => _textEditingName;

  final _textEditingEmail = TextEditingController();
    get textEditingEmail => _textEditingEmail;

  final _textEditingPassword = TextEditingController();
    get textEditingPassword => _textEditingPassword;

  final _textEditingDescription = TextEditingController();
    get textEditingDescription => _textEditingDescription;

  final _blocLoadingVisibility = StreamController<bool>();
  Stream<bool> get streamLoadingVisibility => _blocLoadingVisibility.stream;




  // ----- carregamento visivel ------
  @override
  void loadingVisibility(bool enable){
    _blocLoadingVisibility.sink.add(enable);
  }



  //---------------------------------------------------------------
  @override
  get title => _textEditingTitle.text;
  @override
  set title(title) => _textEditingTitle.text = title;

  @override
  get name => _textEditingName.text;
  @override
  set name(name) => _textEditingName.text = name;

  @override
  get email => _textEditingEmail.text;
  @override
  set email(email) => _textEditingEmail.text = email;

  @override
  get password => _textEditingPassword.text;
  @override
  set password(password) => _textEditingPassword.text = password;

  @override
  get description => _textEditingDescription.text;
  @override
  set description(description) => _textEditingDescription.text = description;

  @override
  void navigationBlackScreen(){
    Navigator.of(_context).pop();
  }


  void btnSave(){
    if(isValidEmail() & isValidTitle() & isValidPassword())
      _presenter.save();
  }


  // ------ validate titulo -------
  final _validateTitle = StreamController<String>();
  Stream<String> get streamValidateTitle => _validateTitle.stream;

  bool isValidTitle(){
    bool valid = !(_textEditingTitle.text == null || _textEditingTitle.text == "");
    _validateTitle.sink.add(valid ? null : S.of(_context).validateTitle);
    return valid;
  }


  // ------ validate email -------
  final _validateEmail = StreamController<String>();
  Stream<String> get streamValidateEmail => _validateEmail.stream;

  bool isValidEmail(){
    bool valid = !(_textEditingEmail.text == null || _textEditingEmail.text == "");
    _validateEmail.sink.add(valid ? null : S.of(_context).validateEmail);
    return valid;
  }


  // ------ validate password -------
  final _validatePassword = StreamController<String>();
  Stream<String> get streamValidatePassword => _validatePassword.stream;

  bool isValidPassword(){
    bool valid = !(_textEditingPassword.text == null || _textEditingPassword.text == "");
    _validatePassword.sink.add(valid ? null : S.of(_context).validatePassword);
    return valid;
  }


  // -------------- informar erro ------------------
  @override
  void infoError(e) {
    // TODO: implement infoError
  }


  void dispose(){
    _validateTitle.close();
    _validateEmail.close();
    _validatePassword.close();
    _blocLoadingVisibility.close();
  }
}
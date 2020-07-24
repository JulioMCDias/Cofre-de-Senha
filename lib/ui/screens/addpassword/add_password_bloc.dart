
import 'dart:async';

import 'package:cofresenha/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddPasswordBloc{
  final BuildContext context;
  AddPasswordBloc(this.context);

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



  // ------ validate titulo -------
  final _validateTitle = StreamController<String>();
  Stream<String> get streamValidateTitle => _validateTitle.stream;

  bool isValidTitle(){
    bool valid = !(_textEditingTitle.text == null || _textEditingTitle.text == "");
    _validateTitle.sink.add(valid ? null : S.of(context).validateTitle);
    return valid;
  }


  // ------ validate email -------
  final _validateEmail = StreamController<String>();
  Stream<String> get streamValidateEmail => _validateEmail.stream;

  bool isValidEmail(){
    bool valid = !(_textEditingEmail.text == null || _textEditingEmail.text == "");
    _validateEmail.sink.add(valid ? null : S.of(context).validateEmail);
    return valid;
  }


  // ------ validate password -------
  final _validatePassword = StreamController<String>();
  Stream<String> get streamValidatePassword => _validatePassword.stream;

  bool isValidPassword(){
    bool valid = !(_textEditingPassword.text == null || _textEditingPassword.text == "");
    _validatePassword.sink.add(valid ? null : S.of(context).validatePassword);
    return valid;
  }



  void dispose(){
    _validateTitle.close();
    _validateEmail.close();
    _validatePassword.close();
  }
}
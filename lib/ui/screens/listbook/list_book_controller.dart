

import 'package:cofresenha/data/model/book.dart';
import 'package:cofresenha/data/repository.dart';
import 'package:cofresenha/ui/screens/listbook/list_book_bloc.dart';
import 'package:cofresenha/ui/screens/listpassword/list_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ListBookCon extends ControllerMVC{
  final _repository = Repository();
  ListBookBloc bloc;

  // Singleton Factory
  ListBookCon._();
  static final ListBookCon _this = ListBookCon._();

  factory ListBookCon() {
    return _this;
  }


//------------------- ListBook -------------------------

  void btnAdd(String book){
    _repository.addBook(book);
    updateListBook();
  }

  void updateListBook(){
    bloc.setListBook(_repository.getListBook());
  }

  void updateBook(Book book, String name){
    _repository.updateBook(book, name);
    updateListBook();
  }

  void btnItem(Book book){

    _navigationListPassword();
  }


  void _navigationListPassword(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => ListPasswordScreen())
    );
  }

  void exitRepository(){

  }
}
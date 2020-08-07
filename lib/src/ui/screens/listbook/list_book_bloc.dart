
import 'dart:async';

import 'package:cofresenha/src/data/model/book.dart';
import 'package:cofresenha/src/presentation/listbook/list_book_presenter.dart';
import 'package:cofresenha/src/presentation/listbook/list_book_view.dart';
import 'package:cofresenha/src/presentation/listpassword/list_password_presenter.dart';
import 'package:cofresenha/src/presentation/splash/splash_presenter.dart';
import 'package:cofresenha/src/ui/screens/listbook/list_book_screen.dart';
import 'package:flutter/material.dart';

class ListBookBloc implements ListBookView{
  @override ListBookScreen screen;
  final ListBookPresenter _presenter;
  BuildContext _context;


  //----- construtor --------
  ListBookBloc(this._presenter) {
    screen = ListBookScreen(this);
  }

  //----- initState -----
  void initState(BuildContext context){
    this._context = context;
  }


  //----------------------- btn ------------------------------
  void btnLogout(){
    _presenter.logoutRepository();
    Navigator.of(_context).pushReplacement(
      MaterialPageRoute(builder: (context) => SplashPresenter().view.screen)
    );
  }

  void btnItem(Book book){
    _presenter.itemBook(book);
  }
  
  void btnAdd(String book){
    _presenter.addBook(book);
  }

  void updateBook(Book book, String name){
    _presenter.updateBook(book, name);
  }


  // ------------- StreamControllers -----------------
  final _blocListBook = StreamController<List<Book>>();
  Stream<List<Book>> get streamListBook => _blocListBook.stream;


  @override
  void setListBook(List<Book> books){
    _blocListBook.sink.add(books);
  }

  @override
  void navigationListPassword(){
    Navigator.push(_context,
      MaterialPageRoute(builder: (context) => ListPasswordPresenter().view.screen)
    );
  }

  void dispose(){
    _blocListBook.close();
  }
}
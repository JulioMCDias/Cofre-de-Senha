
import 'dart:async';

import 'package:cofresenha/data/model/book.dart';

class ListBookBloc{

  final _blocListBook = StreamController<List<Book>>();
  Stream<List<Book>> get streamListBook => _blocListBook.stream;
  
  void setListBook(List<Book> books){
    _blocListBook.sink.add(books);
  }
  


  void dispose(){
    _blocListBook.close();
  }
}
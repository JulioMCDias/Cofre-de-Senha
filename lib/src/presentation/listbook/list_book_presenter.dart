
import 'package:cofresenha/src/data/model/book.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/listbook/list_book_view.dart';
import 'package:cofresenha/src/ui/screens/listbook/list_book_bloc.dart';

class ListBookPresenter{
  ListBookView view;
  final Repository _repository = Repository();

  ListBookPresenter(){
    view = ListBookBloc(this);
  }


  //---------------- ListBookPresenter -------------------
  void addBook(String book){
    _repository.addBook(book);
    _updateListBook();
  }

  void _updateListBook(){
    view.setListBook(_repository.getListBook());
  }

  void updateBook(Book book, String name){
    _repository.updateBook(book, name);
    _updateListBook();
  }

  void itemBook(Book book){
    _repository.bookName = book.name;
    view.navigationListPassword();
  }


  void logoutRepository(){
    _repository.logoutRepository();
  }
}

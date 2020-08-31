
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
  Book _oldBook;
  int _posBook;
  void init(){
    _updateListBook();
  }

  void addBook(String book){
    view.loadingVisibility(true);

    _repository.addBook(book).then((_) {
      _updateListBook();
      view.loadingVisibility(false);

    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });
  }

  void _updateListBook(){
    view.setListBook(_repository.getListBook());
  }

  void updateBook(Book book, String name){
    view.loadingVisibility(true);

    _repository.updateBook(book, name).then((_){
      _updateListBook();
      view.loadingVisibility(false);

    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });
  }

  void remove(Book book, int pos) {
    view.loadingVisibility(true);

    _repository.removeItemBook(book).then((_){
      _updateListBook();
      view.loadingVisibility(false);
      _oldBook = book;
      _posBook = pos;

    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });
  }

  void restoreItemBook() {
    view.loadingVisibility(true);

    _repository.restoreItemBook(_oldBook, _posBook).then((_){
      _updateListBook();
      view.loadingVisibility(false);

    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });
  }

  void itemBook(Book book){
    _repository.bookName = book.name;
    view.navigationListPassword();
  }


  void logoutRepository(){
    _repository.logoutRepository();
  }
}

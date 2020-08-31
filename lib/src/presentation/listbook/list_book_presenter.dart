
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
      view.infoError(e);
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
      view.infoError(e);
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
